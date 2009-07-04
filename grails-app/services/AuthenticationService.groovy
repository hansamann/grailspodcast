import authentication.LoginForm
import authentication.SignupForm
import authentication.AuthenticatedUser

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.springframework.beans.factory.InitializingBean
import org.springframework.context.ApplicationContext
import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes
import org.codehaus.groovy.grails.web.metaclass.RedirectDynamicMethod
import org.springframework.context.ApplicationContextAware

class AuthenticationService implements InitializingBean, ApplicationContextAware {
	
	static final STATUS_NEW = 0
	static final STATUS_VALID = 1
	static final STATUS_AWAITING_CONFIRMATION = 2
	static final STATUS_CONFIRMATION_LAPSED = 3

    // We set this to true even though we don't directly use GORM
    // The event handlers are likely to require a transaction
	boolean transactional = true 

    def redirectMethod
    
    /**
     * <p>Create a new user account, with domain and email notification etc deferred to the 
     * event handlers.</p>
     * <p>This method will first invoke the onFindByLogin event to see if a user already exists.
     * If so it will return a user object with the ERROR_LOGIN_NAME_NOT_AVAILABLE result.</p>
     * <p>If it does not already exist, it will then call the onNewUserObject event to create a new user
     * record in your backing store, which is typically a Grails domain class (or the default one supplied by
     * the plugin).</p>
     * <p>Next the onConfirmAccount event is triggered. This returns true to indicate that confirmation
     * of the user - i.e. two-phase registration, typicaly with email address confirmation - is needed. This
     * even must return false if no user confirmation is required.</p>
     * <p>After this, the onSaveUser event is called to save the new user details.</p>
     * <p>Finally, the onSignup event is called to indicate that a new account has been created, whether it
     * is pending confirmation or not. The "extraParams" object is passed to the event in case there are custom
     * fields to capture from the signup process that are opaque to the authentication plugin.</p>
     * @param params A map of parameters to include "login" and "password" at the very least, optionally
     * containing "email" (user's email address) and "immediate" (a boolean indicating whether the user should
     * be immediately logged in if confirmation is not being required) - and "extraParams" a map of any other parameters
     * typically the request params from the controller so that any custom fields from the signup process
     * can be captured and passed to the onSignup event.
     */
	AuthenticatedUser signup(Map params) {
        assert !ConfigurationHolder.config.authentication.signup.disabled, "Cannot perform signup, it is disabled in Config"
        
		def login = params.login
		def password = params.password
		
		assert login, "Method 'signup' requires a named login parameter"
		assert password, "Method 'signup' requires a named password parameter"
		
		def email = params.email
		def logInImmediately = params.immediate
		
		def user = fireEvent('FindByLogin', login)
		
		def authUser = new AuthenticatedUser(login:login)
		if (user) {
			authUser.result = AuthenticatedUser.ERROR_LOGIN_NAME_NOT_AVAILABLE
			return authUser
		}
		
		user = fireEvent('NewUserObject', login)
		user.login = login
		user.password = encodePassword(password)
		user.email = email
		user.status = STATUS_AWAITING_CONFIRMATION
		
		// See if confirmation required, onConfirmAccount will return true if so
		if (fireEvent('ConfirmAccount', user)) {
			logInImmediately = false // these are mutually exclusive settings
		} else {
			user.status = STATUS_VALID
		}
		
		if (!fireEvent('SaveUser', user)) {
			log.error( "Failed to save user: $user / $login - ${user.errors}")
			throw new RuntimeException("Unable to save user details for ${login}")
		}
		
		if (log.infoEnabled) {
			log.info("Sign up complete for user ${login}")
		}
		
		// Convert the status to a result code
		authUser.result = userStatusToResult(user.status)

		// Fire event
		fireEvent('Signup', [user:user, params:params.extraParams])

		if (logInImmediately) {
			doLoggedIn(authUser)
		}

		return authUser
	}

	boolean exists(login) {
		return fireEvent('FindByLogin', login)
	}

	AuthenticatedUser login(login, pass) {
		def user = fireEvent('FindByLogin', login)
		
		def token = new AuthenticatedUser(login:login, loginTime:new Date()) 

		if (!user) {
			token.result = AuthenticatedUser.ERROR_NO_SUCH_LOGIN
		} else if (user.password != encodePassword(pass)) {
			token.result = AuthenticatedUser.ERROR_INCORRECT_CREDENTIALS
		} else {
			token.result = userStatusToResult(user.status)
			doLoggedIn(token)
		}
		return token 
	}

	protected userStatusToResult(def userStatus) {
		def value
		switch (userStatus) {
			case STATUS_NEW : 
			case STATUS_VALID :
				value = 0
				break
			case STATUS_AWAITING_CONFIRMATION :
			case STATUS_CONFIRMATION_LAPSED :
				value = AuthenticatedUser.AWAITING_CONFIRMATION
				break
			default :
				throw new IllegalArgumentException("Unrecognized value $userStatus passed to userStatusToResult")
		}
		return value
	}
	
	protected void doLoggedIn(AuthenticatedUser user) {
		user.loggedIn = true
		user.loginTime = new Date()
		if (log.infoEnabled) {
			log.info("Logged in user ${user.login}")
		}
		// Fire event
		fireEvent('LoggedIn', user)
	}
	
	void logout(AuthenticatedUser authenticatedUser) {
		if (log.debugEnabled) {
			log.debug("Logging out with authenticated user object ${authenticatedUser}")
		}
		authenticatedUser.loggedIn = false
		if (log.infoEnabled) {
			log.info("Logged out user ${authenticatedUser.login}")
		}
		fireEvent('LoggedOut', authenticatedUser)
	}
	
	/**
	 * Call when a user's account has been confirmed and can now be used
	 *
	 * @return true if user was found and confirmed, false if user not found
	 */
	boolean confirmUser(login) {
		def user = fireEvent('FindByLogin', login)
	
		if (!user) {
			return false
		} else {
			user.status = STATUS_VALID
			if (!fireEvent('SaveUser', user)){
				throw new RuntimeException("Unable to save confirmed user $user")
			}
			return true
		}
	}
	
	boolean delete(login) {
		def user = fireEvent('FindByLogin', login)
		
		if (!user) {
			return false
		}
		
		// Fire event
		fireEvent('Delete', user)

		if (log.infoEnabled) {
			log.info("Deleted user ${login}")
		}
		
		return true
	}
	
	def handleAuthenticatedRequest = { request, loginUrl -> 
        if (!request.session.authenticatedUser?.loggedIn) {
            redirect(loginUrl)
            return false;
        } else {
            return true;
        }
	}
	
	/* 
	   Event handlers - stores all default event handler methods.
	   Default is a hash map with closure values for each property key but you can re-assign
	   eventHandler to any object within your app that also provides these properties.
	   
	   The events are functions or methods using the parameters and return values shown below.
	*/
    private static defaultEventHandlers = [
	    // Called to validate the user's chosen login name, i.e. is it too short or in use? Return true if valid
	    onValidateLogin:{ loginID -> true },
    	// Called to validate the user's password, i.e. is it long enough/strong enough. Return true if valid
    	onValidatePassword: { password -> true },
    	// Called to encode the user's password prior to saving it, i.e. return digested/XOR'd password
    	// Defaults to MD5 hash, i.e. clear text in the database
    	onEncodePassword: { password -> password?.encodeAsMD5Hex() },
    	// Called to load the user object by login id, must retun the user object or null if not found
        onFindByLogin:{ loginID -> AuthenticationService.userDomainClass.findByLogin(loginID) },
        // Called when a new user object is required, object returned must have login, password, email and status properties
        onNewUserObject: { loginID -> def obj = AuthenticationService.userDomainClass.newInstance(); obj.login = loginID; return obj },
        // Called when a user object has been changed and needs to be saved
        // This impl assumes its a GORM object
        onSaveUser: { user -> user.save() },
        // Called when a user has logged in
        onLoggedIn: { AuthenticatedUser login -> },
        // Called when a user has logged out
        onLoggedOut: { AuthenticatedUser login -> },
        // Called on successful signup, although email may not be confirmed yet - params are the request (form) params
        onSignup: { params -> },
        // Called when an account has to be deleted, passing in the user object supplied by onNewUserObject
        onDelete: { user -> user.delete() },
        // Called to see if email confirmation is required, return true if user cannot log in yet until confirmed
        onConfirmAccount: { user -> },
        // Called to see if a logged in user can access the requested resource
        // params has properties: request, user, controllerName, actionName
        onCheckAuthorized: { params -> true },
        // Called after a denied access
        // params has properties: request, response
        onUnauthorizedAccess: { params -> params.response.sendError(403) }
    ]

    def events = defaultEventHandlers
    static userDomainClass = AuthenticationUser
    
    void setApplicationContext(ApplicationContext ctx) {
        redirectMethod = new RedirectDynamicMethod(ctx)
    }
    
    void afterPropertiesSet() {
        // Take events from config if found
        if (ConfigurationHolder.config.configObject.authenticationEvents) {
            events = ConfigurationHolder.config.configObject.authenticationEvents 
        }
        // Take domain class from config if found
        if (ConfigurationHolder.config.configObject.authenticationUserClass) {
            AuthenticationService.userDomainClass = ConfigurationHolder.config.configObject.authenticationUserClass 
        }
    }
	
	/************** IMPORTANT **************/
	// These two methods have to live here
	// As we cannot put static methods in the service class itself
	// as they cannot then refer to an injected prefs service
	// The need to be static here to enable them to be used in domain class and command object
	// validators
	
	def checkLogin(def value) {
		return fireEvent("ValidateLogin", value)
	}
	
	def checkPassword(def value) {
		return fireEvent("ValidatePassword", value)
	}

	// This is here just so we can unit test easier, hard to mock out and assert a closure property
	def encodePassword(def value) {
		return fireEvent("EncodePassword", value)
	}

	// Trigger events
	def fireEvent(eventName, data) {
        if (log.debugEnabled) log.debug( "Firing event $eventName with $data")
		return events."on$eventName"(data)
	}	
	
	// Called to check it the current request has a successfully logged in user
	boolean isLoggedIn(request) {
	    def user = request.session.getAttribute('authenticatedUser')
		return (user?.result == 0) && user?.loggedIn
	}
	
	/**
	 * Call from filters to enforce authenticated user, redirect to login form / use http auth,
	 * handle "next URL" mechanics and optionally enforce authorisation
	 * loginURI must be URI relative to this server (must include application context) and will be 
	 * redirected to if the user is not logged in
	 */
	boolean filterRequest( request, response, loginURI) {
        if (!isLoggedIn(request)) {
    	    if (log.debugEnabled) log.debug("Filtering request - user not logged in, redirecting to ${loginURI}")
            response.sendRedirect(loginURI) // Crappy but we can't use smart dynamic redirect
    	    return false // Indicate "don't carry on processing" as auth is required
        }

        // do authorisation events
        if (fireEvent("CheckAuthorized", [request: request, user: request.session.getAttribute('authenticatedUser'),
                controllerName: request.getAttribute(GrailsApplicationAttributes.CONTROLLER_NAME_ATTRIBUTE), 
                actionName: request.getAttribute(GrailsApplicationAttributes.ACTION_NAME_ATTRIBUTE) ] )) {
    	    if (log.debugEnabled) log.debug("Filtering request - user ${request.session.getAttribute('authenticatedUser')} authorized access")
            return true
        } else {
    	    if (log.debugEnabled) log.debug("Filtering request - user ${request.session.getAttribute('authenticatedUser')} denied access")
            // Let the app know, for logging etc
            fireEvent("UnauthorizedAccess", [request:request, response:response])
            return false
        } 
	}

}


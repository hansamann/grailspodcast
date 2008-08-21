import groovy.mock.interceptor.*
import authentication.*

class AuthenticationControllerTests extends GroovyTestCase {

	void testSignupWithDataWithFlash() {
		def controller = new AuthenticationController()
		
		def authUser = new AuthenticatedUser(login:'marc', loggedIn:true, result:0 )
		def mockAuth = new MockFor( AuthenticationService)
		mockAuth.demand.signup(1) { params ->
			return authUser
		}
		
		controller.flash.authSuccessURL = [url:'/signedup']
		controller.flash.authErrorURL = [url:'/failure']
		controller.flash.next()

		controller.params.login = 'marcpalmer'
		controller.params.email = 'spamtrap@anyware.co.uk'
		controller.params.password = 'secret'
		controller.params.passwordConfirm = 'secret'
		
		mockAuth.use {
			controller.authenticationService = new AuthenticationService()
		    controller.signup()
			assertTrue controller.session.authenticatedUser.loggedIn
			assertEquals "marc", controller.session.authenticatedUser.login
		}

		assert controller.response.redirectedUrl == "/signedup"
	}

	void testSignupWithData() {
		def controller = new AuthenticationController()
		
		def authUser = new AuthenticatedUser(login:'marc', loggedIn:true, result:0 )
		def mockAuth = new MockFor( AuthenticationService)
		mockAuth.demand.signup(1) { params ->
			return authUser
		}
		
		controller.params.success_controller = 'signedup'
		controller.params.success_action = 'index'
		controller.params.error_controller = 'failure'
		controller.params.error_action = 'whoops'
		controller.params.login = 'marcpalmer'
		controller.params.email = 'spamtrap@anyware.co.uk'
		controller.params.password = 'secret'
		controller.params.passwordConfirm = 'secret'
		
		mockAuth.use {
			controller.authenticationService = new AuthenticationService()
		    controller.signup()
			assertTrue controller.session.authenticatedUser.loggedIn
			assertEquals "marc", controller.session.authenticatedUser.login
		}

		assert controller.response.redirectedUrl == "/signedup/index"
	}

	void testSignupWithBadData() {
		def controller = new AuthenticationController()
		
		def mockAuth = new MockFor( AuthenticationService)
		
		controller.params.success_controller = 'signedup'
		controller.params.success_action = 'index'
		controller.params.error_controller = 'failure'
		controller.params.error_action = 'whoops'

		mockAuth.use {
			controller.authenticationService = new AuthenticationService()
			controller.params.login = "something"
			controller.signup()
		}

		assertEquals "something", controller.flash.signupForm.@login
		assert controller.response.redirectedUrl == "/failure/whoops"
	}

	void testSignupWithBadDataWithFlash() {
		def controller = new AuthenticationController()
		
		def mockAuth = new MockFor( AuthenticationService)
		
		controller.flash.authErrorURL = [url:'/invalid']
		controller.flash.next()

		mockAuth.use {
			controller.authenticationService = new AuthenticationService()
			controller.params.login = "something"
			controller.signup()
		}

		assertEquals "something", controller.flash.signupForm.@login
		assert controller.response.redirectedUrl == "/invalid"
	}

	void testSignupWithLoginAlreadyTaken() {
		def controller = new AuthenticationController()
	
		def authUser = new AuthenticatedUser(login:'marc', loggedIn:true, 
			result:AuthenticatedUser.ERROR_LOGIN_NAME_NOT_AVAILABLE )
		def mockAuth = new MockFor( AuthenticationService)
		mockAuth.demand.signup(1) { params ->
			return authUser
		}
		
		controller.params.login = 'marcpalmer'
		controller.params.email = 'spamtrap@anyware.co.uk'
		controller.params.password = 'secret'
		controller.params.passwordConfirm = 'secret'
			
		controller.flash.authErrorURL = [url:"/failure"]
		controller.flash.next()
		
		mockAuth.use {
			controller.authenticationService = new AuthenticationService()
			controller.signup()
		}

		assertEquals AuthenticatedUser.ERROR_LOGIN_NAME_NOT_AVAILABLE, controller.flash.authenticationFailure.result
		assertNotNull controller.flash.signupForm
		assertTrue controller.flash.signupForm instanceof SignupForm
		assert controller.response.redirectedUrl == "/failure"
	}
	
	void testSignupWithEmailConfirmationRequired() {
		def controller = new AuthenticationController()
	
		def authUser = new AuthenticatedUser(login:'marc', loggedIn:true, 
			result:AuthenticatedUser.AWAITING_CONFIRMATION )
		def mockAuth = new MockFor( AuthenticationService)
		mockAuth.demand.signup(1) { params ->
			return authUser
		}
		
		def mockForm = new StubFor( SignupForm)
		controller.params.login = 'marcpalmer'
		controller.params.password = 'secret'
		controller.params.passwordConfirm = 'secret'
		controller.params.email = "spamtrap@anyware.co.uk"

		controller.flash.authSuccessURL = [url:"/awaitConf"]
		controller.flash.next()

		mockAuth.use {
			controller.authenticationService = new AuthenticationService()
			controller.signup()
		}

		assertEquals AuthenticatedUser.AWAITING_CONFIRMATION, controller.session.authenticatedUser.result
		assert controller.response.redirectedUrl == "/awaitConf"
		assertEquals "marc", controller.session.authenticatedUser.login
	}

	void testLogin() {
		def controller = new AuthenticationController()
		
		def authUser = new AuthenticatedUser(login:'marcpalmer', loggedIn:false, result:0 )

		def mockAuth = new MockFor( AuthenticationService)
		mockAuth.demand.login(1) { login, password ->
		    authUser.loggedIn = true
			return authUser
		}
		
        controller.params.login = "marcpalmer"
        controller.params.password = "secret"
		
		controller.params.success_controller = 'portal'
		controller.params.success_action = 'dashboard'
		controller.params.error_controller = 'invalid'
		controller.params.error_action = 'error'
		
		mockAuth.use {
			controller.authenticationService = new AuthenticationService()
			controller.login()
			assertEquals 0, controller.session.authenticatedUser.result
			assertTrue controller.session.authenticatedUser.loggedIn
			assertEquals "marcpalmer", controller.session.authenticatedUser.login
		}

		assert controller.response.redirectedUrl == "/portal/dashboard"
		assertEquals "marcpalmer", controller.session.authenticatedUser.login
		assertEquals "marcpalmer", controller.flash.loginForm.login
	}

	void testLoginLogout() {
		def params = [:]
        params.login = "marcpalmer"
        params.password = "secret"
		
		params.success_controller = 'portal'
		params.success_action = 'dashboard'
		params.error_controller = 'invalid'
		params.error_action = 'error'

		def authUser = new AuthenticatedUser(login:'marcpalmer', loggedIn:true, result:0 )

        // Do the logout
		def controller = new AuthenticationController()
		controller.session.authenticatedUser = authUser
		
		def mockAuth = new MockFor( AuthenticationService)
		mockAuth.demand.logout(1) { user ->
		    println "user is: $user"
		    user.loggedIn = false
		}
	
		controller.params.putAll(params)
		
		mockAuth.use {
			controller.authenticationService = new AuthenticationService()
			controller.logout()
			assertNull controller.session.authenticatedUser
			assertFalse authUser.loggedIn
		}
		assert controller.response.redirectedUrl == "/portal/dashboard"
	}

	void testLoginWithFlash() {
		def controller = new AuthenticationController()
		
		def authUser = new AuthenticatedUser(login:'marcpalmer', loggedIn:true, result:0 )

		def mockAuth = new MockFor( AuthenticationService)
		mockAuth.demand.login(1) { login, password ->
			return authUser
		}
		
        controller.params.login = "marcpalmer"
        controller.params.password = "secret"
		
		controller.flash.authSuccessURL = [url:"/portal/dashboard"]
		controller.flash.next()
		
		mockAuth.use {
			controller.authenticationService = new AuthenticationService()
			controller.login()
			assertTrue controller.session.authenticatedUser.loggedIn
			assertEquals "marcpalmer", controller.session.authenticatedUser.login
			assertEquals 0, controller.session.authenticatedUser.result
		}

		assert controller.response.redirectedUrl == "/portal/dashboard"
		assertEquals "marcpalmer", controller.session.authenticatedUser.login
		assertEquals "marcpalmer", controller.flash.loginForm.login
	}
}

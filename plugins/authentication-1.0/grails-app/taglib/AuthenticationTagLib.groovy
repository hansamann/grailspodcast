import authentication.AuthenticatedUser

class AuthenticationTagLib {

    static namespace = "auth"
    
    def authenticationService

    boolean checkLoggedIn() { 
        return authenticationService.isLoggedIn(request)
	}
	
	def ifLoggedIn = { attrs, body -> 
		if (checkLoggedIn()) {
			out << body()
		}
	}

	def ifUnconfirmed = { attrs, body -> 
		if (session.authenticatedUser?.result == AuthenticatedUser.AWAITING_CONFIRMATION) {
			out << body()
		}
	}

	def ifNotLoggedIn = { attrs, body -> 
		if (!session.authenticatedUser || !checkLoggedIn()) {
			out << body()
		}
	}
	
	def user = { attrs -> 
		if (checkLoggedIn()) {
			out << session.authenticatedUser[attrs.property ? attrs.property : 'login'].encodeAsHTML()
		}
	}

    /**
     * Render an authentication form
     * 
     * Attributes:
     * 
     * action - optional : will default to plugin's authentication controller with "authAction" as action
     * method - optional : defaults to POST (via g:form)
     * successUrl - map of controller/action/id params
     * errorUrl - map of controller/action/id params
     * Usage:
     * 
     * <auth:form authAction="login" successUrl="[controller:'portal', action:'justLoggedIn']"
     *     errorUrl="[controller:'content', action:'login']">
     *    <!-- input fields here, auto generated if blank body() -->
     * </auth:form>
     */
    def form = { attrs, body ->
        def authAction = attrs.remove('authAction')
        def args = [success:attrs.remove('success'), error:attrs.remove('error')]
        
        if (!args.success)
            throwTagError("auth:form tag requires 'success' parameter to indicate successful url")
        if (!args.error)
            throwTagError("auth:form tag requires 'error' parameter to indicate error url")
            
        def formAttrs = attrs.clone()
        if (!attrs.url) {
            if (!authAction)
                throwTagError("auth:form tag requires 'authAction' parameter to indicate login action")
            formAttrs.url = [controller:'authentication', action:authAction]
        }
            
        out << g.form(formAttrs) {
            args.keySet().each() { kind ->
                def url = args[kind]
                if (url.controller) {
                    out << g.hiddenField(name:"${kind}_controller", value: url.controller)
                }
                if (url.action) {
                    out << g.hiddenField(name:"${kind}_action", value: url.action)
                }
                if (url.id) {
                    out << g.hiddenField(name:"${kind}_id", value: url.id)
                }
            }
            if (body) {
                out << body() // Add to this - if body is null, automatically write a simple user+pass form with Log in button
            }
        }
    }
    
    def logoutLink = { attrs, body ->
        def attribs = [controller:'authentication', action:'logout', params:[:]]
        def success = attrs.remove('success')
        if (!success)
            throwTagError("auth:logoutLink tag requires 'success' parameter to indicate successful url")

        if (success.controller) attribs.params["success_controller"] = success.controller
        if (success.action) attribs.params["success_action"] = success.action
        if (success.id) attribs.params["success_id"] = success.id
        
        attrs.url = attribs
        out << g.link(attrs, body)
    }
}
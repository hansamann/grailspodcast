class SecureController
{
	def authenticationService
	
	def beforeInterceptor = [action:this.&auth]

	// defined as a regular method so its private
	def auth() {
		 if (!authenticationService.isLoggedIn(request)) 
		 {
			 //response.sendRedirect("/authentication/login")
			 redirect(controller:"authentication", params:[success_uri:request.forwardURI])
			 return false
		 }
	}

}
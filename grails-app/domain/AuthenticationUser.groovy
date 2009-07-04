class AuthenticationUser { 
	String login
	String password
	String email
	int status = AuthenticationService.STATUS_NEW
	
	def authenticationService
	
	static constraints = {
		login(size:5..64, unique: true, validator: { val, obj -> obj.authenticationService.checkLogin(val) } )
		password(size:5..32, password: true, validator: { val, obj -> obj.authenticationService.checkPassword(val) })
		email(email:true, nullable: true, blank: false)
		status(inList:[
			AuthenticationService.STATUS_NEW, 
			AuthenticationService.STATUS_VALID, 
			AuthenticationService.STATUS_AWAITING_CONFIRMATION, 
			AuthenticationService.STATUS_CONFIRMATION_LAPSED
		])
	}
}	

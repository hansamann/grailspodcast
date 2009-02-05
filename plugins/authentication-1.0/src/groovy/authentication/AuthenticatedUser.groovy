package authentication

/**
 * Class encapsulating the result of a login. Encapsulates errors also so that
 * login failures to not use exceptions (very bad for performance and they are not ... exceptional)
 */
class AuthenticatedUser implements Serializable {
	static final ERROR_NO_SUCH_LOGIN = 1
	static final ERROR_INCORRECT_CREDENTIALS = 2
	static final ERROR_LOGIN_NAME_NOT_AVAILABLE = 3
	static final AWAITING_CONFIRMATION = 4
	
	String login
	Date loginTime
	boolean loggedIn
	boolean confirmed
	def attributes = [:]
	
	int result
}
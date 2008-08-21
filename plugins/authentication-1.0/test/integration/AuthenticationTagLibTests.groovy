class AuthenticationTagLibTests extends GroovyTestCase {

	void testAuthForm() {
		def tag = new AuthenticationTagLib()
		
		def result = tag.form([authAction:"login", success:[controller:'good', action:'loggedIn'],
		    error:[controller:'bad', action:'failed']]) {
		        //textField([name:"test", value:"dummy"])
		}
		    
		def output = result
		
		println output

		assertTrue output.contains("<form")
		assertTrue output.contains("action=\"/authentication/login\"")

		assertTrue output.contains("name=\"success_controller\" value=\"good\"")
		assertTrue output.contains("name=\"success_action\" value=\"loggedIn\"")
		assertTrue output.contains("name=\"error_controller\" value=\"bad\"")
		assertTrue output.contains("name=\"error_action\" value=\"failed\"")

//		assertTrue result.contains("name=\"test\" value=\"dummy\"")
	}

	void testLogoutLink() {
		def tag = new AuthenticationTagLib()
		
		def result = tag.logoutLink([success:[controller:'good', action:'loggedIn']]) {
		}
		    
		def output = result
		
		assertTrue output.contains('/authentication/logout?')
		assertTrue output.contains('success_controller=good')
		assertTrue output.contains('success_action=loggedIn')
    }

	void testLogoutLinkPartialParams() {
		def tag = new AuthenticationTagLib()
		
		def result = tag.logoutLink([success:[action:'loggedIn']]) {
		}
		    
		def output = result
		
		assertTrue output.contains('/authentication/logout?')
		assertTrue output.contains('success_action=loggedIn')
    }
}

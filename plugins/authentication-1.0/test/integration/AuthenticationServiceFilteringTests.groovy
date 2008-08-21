import groovy.mock.interceptor.*
import authentication.*
import grails.util.GrailsWebUtil
import org.springframework.mock.web.*
import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes

class AuthenticationServiceFilteringTests extends GroovyTestCase {
	
	void testFilterRequestNotLoggedIn() {
		def service = new AuthenticationService()

	    def request = GrailsWebUtil.bindMockWebRequest()
	    request.currentRequest.setAttribute(GrailsApplicationAttributes.CONTROLLER_NAME_ATTRIBUTE, 'test')
	    request.currentRequest.setAttribute(GrailsApplicationAttributes.ACTION_NAME_ATTRIBUTE, 'index')

	    def response = new MockHttpServletResponse()
	    
        assertFalse service.filterRequest(request.currentRequest, response, '/authentication/login')
        
        assertEquals '/authentication/login', response.redirectedUrl
	}

	void testFilterRequestLoggedInNotAuth() {
		def service = new AuthenticationService()

        def dummyuser = new AuthenticatedUser(login:'marcpalmer', loggedIn: true)
	    def request = GrailsWebUtil.bindMockWebRequest()
	    def response = new MockHttpServletResponse()
	    request.session.authenticatedUser = dummyuser
	    request.currentRequest.setAttribute(GrailsApplicationAttributes.CONTROLLER_NAME_ATTRIBUTE, 'test')
	    request.currentRequest.setAttribute(GrailsApplicationAttributes.ACTION_NAME_ATTRIBUTE, 'index')
	    	    
		def mockEvents = new MockFor(DummyEventHandler)
		mockEvents.demand.onCheckAuthorized(1) { params -> 
			assert params.user == dummyuser
			assert params.request == request.currentRequest
			assert params.controllerName == 'test'
			assert params.actionName == 'index'
			return false
		}
		mockEvents.demand.onUnauthorizedAccess(1) { params -> 
			assert params.response == response
			assert params.request == request.currentRequest
			response.sendError(403)
		}

		mockEvents.use {
			service.events = new DummyEventHandler()

			assertFalse service.filterRequest(request.currentRequest, response, '/authentication/login')
            assertEquals 403, response.status
		}
	}
	
	void testFilterRequestLoggedInAuthOK() {
		def service = new AuthenticationService()

        def dummyuser = new AuthenticatedUser(login:'marcpalmer', loggedIn: true)
	    def request = GrailsWebUtil.bindMockWebRequest()
	    def response = new MockHttpServletResponse()

	    request.session.authenticatedUser = dummyuser
	    request.currentRequest.setAttribute(GrailsApplicationAttributes.CONTROLLER_NAME_ATTRIBUTE, 'test')
	    request.currentRequest.setAttribute(GrailsApplicationAttributes.ACTION_NAME_ATTRIBUTE, 'index')
	    
		def mockEvents = new MockFor(DummyEventHandler)
		mockEvents.demand.onCheckAuthorized(1) { params -> 
			assert params.user == dummyuser
			assert params.request == request.currentRequest
			assert params.controllerName == 'test'
			assert params.actionName == 'index'
			return true
		}

		mockEvents.use {
			service.events = new DummyEventHandler()

			assertTrue service.filterRequest(request.currentRequest, response, '/authentication/login')
		}
	}    
}
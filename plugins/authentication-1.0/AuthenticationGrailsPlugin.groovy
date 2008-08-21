
class AuthenticationGrailsPlugin {
	def version = 1.0
    def author = "Marc Palmer"
    def authorEmail = "marc@anyware.co.uk"
    def title = "Simple, extensible authentication services with signup support"
    def description = '''
    Simple authentication mechanisms with signup and authorisation hooks and DB abstraction, all handled with
    events.
    '''
    def documentation = 'http://grails.org/Authentication+Plugin'
    	
	def doWithSpring = {
		// TODO Implement runtime spring config (optional)
	}   
	def doWithApplicationContext = { applicationContext ->
		// TODO Implement post initialization spring config (optional)		
	}
	def doWithWebDescriptor = {
		// TODO Implement additions to web.xml (optional)
	}	                                      
	def onChange = { event ->
		// TODO Implement code that is executed when this class plugin class is changed  
		// the event contains: event.application and event.applicationContext objects
	}                                                                                  
	def onApplicationChange = { event ->
		// TODO Implement code that is executed when any class in a GrailsApplication changes
		// the event contain: event.source, event.application and event.applicationContext objects
	}
}

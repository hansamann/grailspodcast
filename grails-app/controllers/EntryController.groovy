import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.GrailsApplication

class EntryController extends SecureController {

	def twitterService
	
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if (!params.max) params.max = 10
		if (!params.order) params.order = "desc"
        if (!params.sort) params.sort = "created"
        [ entryList: Entry.list( params ) ]
    }

    def show = {
        def entry = Entry.get( params.id )

        if(!entry) {
            flash.message = "Entry not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ entry : entry ] }
    }

    def delete = {
        def entry = Entry.get( params.id )
        if(entry) {
            entry.delete()
            flash.message = "Entry ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Entry not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def entry = Entry.get( params.id )

        if(!entry) {
            flash.message = "Entry not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ entry : entry ]
        }
    }

    def update = {
        def entry = Entry.get( params.id )
        if(entry) {
            entry.properties = params
            
            if (params.contentHTML)
            {
            	log.debug("Using contentHTML instead of content")
            	entry.content = params.contentHTML
            }
            
            if(!entry.hasErrors() && entry.save()) {
                flash.message = "Entry ${params.id} updated"

                if (GrailsUtil.environment != GrailsApplication.ENV_DEVELOPMENT && params.twitter)
                {
                	try
    	            {	
    	            	twitterService.announceUpdatedEntry(entry)
    	            } catch (Exception e)
    	            {
    	            	log.warn('Unable to send update twitter message', e)
    	            }
                }
                else
                {
                	log.info('Not sending twitter message')
                }                
                
                redirect(action:show,id:entry.id)
            }
            else {
                render(view:'edit',model:[entry:entry])
            }
        }
        else {
            flash.message = "Entry not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def entry = new Entry()
        entry.properties = params
        return ['entry':entry]
    }

    def save = {
        def entry = new Entry(params)
        
        if (params.contentHTML)
        {
        	log.debug("Using contentHTML instead of content")
        	entry.content = params.contentHTML
        }
        
        if(!entry.hasErrors() && entry.save()) {
            flash.message = "Entry ${entry.id} created"
           
            if (GrailsUtil.environment != GrailsApplication.ENV_DEVELOPMENT && params.twitter)
            {
            	try
	            {	
	            	twitterService.announceEntry(entry)
	            } catch (Exception e)
	            {
	            	log.warn('Unable to send twitter message', e)
	            }
            }
            else
            {
            	log.info('Not sending twitter message')
            }
        
            redirect(action:show,id:entry.id)
        }
        else {
            render(view:'create',model:[entry:entry])
        }
    }
}

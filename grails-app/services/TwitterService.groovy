import twitter4j.TwitterException
import twitter4j.Twitter
class TwitterService {

    boolean transactional = false

    def announceEntry(entry)
    {
    	def tinyURL = tinyURL("http://www.grailspodcast.com/blog/id/${entry.id}")
    	def remaining = 130 - tinyURL.size()
    	def msg = "${entry.title} just published: "
   
    	if (msg.size() > remaining)
    		msg = msg[0..remaining] + '... ' + tinyURL
    	else
    		msg = msg + ' ' + tinyURL
    
    	sendMessage(msg)
    }

	def announceUpdatedEntry(entry)
	{
    	def tinyURL = tinyURL("http://www.grailspodcast.com/blog/id/${entry.id}")
    	def remaining = 130 - tinyURL.size()
    	def msg = "${entry.title} was updated: "
    	
    	if (msg.size() > remaining)
    		msg = msg[0..remaining] + '... ' + tinyURL
    	else
    		msg = msg + ' ' + tinyURL    	
    	
    	sendMessage(msg)
	}
    
    def announceComment(entry)
    {
    	def tinyURL = tinyURL("http://www.grailspodcast.com/blog/id/${entry.id}")
    	def remaining = 130 - tinyURL.size()
    	def msg = "New comment for ${entry.title}: "
    	
    	if (msg.size() > remaining)
    		msg = msg[0..remaining] + '... ' + tinyURL
    	else
    		msg = msg + ' ' + tinyURL
    		
    	sendMessage(msg)		
    }
    
    def sendMessage(msg) 
    {
        def podcastUser = AuthenticationUser.findByLogin('grailspodcast')
        def twitter = new Twitter('grailspodcast', podcastUser.password)

        try
        {
            def status = twitter.updateStatus(msg)
        }
        catch (TwitterException e)
        {
            log.warn("Unable to update status: " + msg, e)
        }

    }
    
    def tinyURL(urlString)
    {
    	def tinyUrl = new URL('http://tinyurl.com/api-create.php?url=' + urlString).text    	
    }
}

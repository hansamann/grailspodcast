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
    	def urlString = "http://twitter.com/statuses/update.xml"
    	URL url = new URL (urlString)
    	def podcastUser = AuthenticationUser.findByLogin('grailspodcast')
    	def userPassword = "grailspodcast:${podcastUser.password}"
    	String encoding = new sun.misc.BASE64Encoder().encode (userPassword.getBytes())
    	URLConnection uc = url.openConnection()
    	uc.setDoOutput(true)
    	uc.setRequestProperty ("Authorization", "Basic " + encoding)
    	OutputStreamWriter out = new OutputStreamWriter(uc.getOutputStream())
    	out.write("status=" + java.net.URLEncoder.encode(msg))
    	out.close()

    	log.info("Twitter message sent, responseCode: ${uc.getResponseCode()}")
    }
    
    def tinyURL(urlString)
    {
    	def tinyUrl = new URL('http://tinyurl.com/api-create.php?url=' + urlString).text    	
    }
}

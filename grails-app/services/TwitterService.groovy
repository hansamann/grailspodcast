class TwitterService {

    boolean transactional = false

    def announceEntry(entry)
    {
    	def entryURL = "http://www.grailspodcast.com/blog/id/${entry.id}"
    	def tinyURL = tinyURL(entryURL)
    	def msg = "${entry.title} was just published: ${tinyURL}}"
    	sendMessage(msg)
    }

	def announceUpdatedEntry(entry)
	{
    	def entryURL = "http://www.grailspodcast.com/blog/id/${entry.id}"
    	def tinyURL = tinyURL(entryURL)
    	def msg = "${entry.title} was updated: ${tinyURL}}"
    	sendMessage(msg)		
	}
    
    def announceComment(entry)
    {
    	def entryURL = "http://www.grailspodcast.com/blog/id/${entry.id}"
    	def tinyURL = tinyURL(entryURL)
    	def msg = "New comment for ${entry.title}: ${tinyURL}}"
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

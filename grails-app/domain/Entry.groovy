import java.text.SimpleDateFormat

class Entry {
    static hasMany = [comments:Comment]
	
	String title
	String content
	Date created
	String tags = "groovy grails"
	String enclosureURL
	Integer enclosureLength
	String enclosureType = "audio/mpeg"
	
	static constraints = {
		title()
		content(widget:'textarea', maxSize:10000)
		created()
		tags(blank:false)
		enclosureURL(nullable:true)
		enclosureLength(nullable:true)
		enclosureType(nullable:true)
	}
	
	def getHumanReadableDate()
	{
		def dateFormat = new SimpleDateFormat("EEE, MMM d, yyyy - HH:mm")
		def nowString = dateFormat.format(created) + ' UTC';
	}
	
	def getFormattedTags()
	{
		tags?.split(' ').collect { it.toUpperCase()}.join(' &middot; ')
	}
	
	def getFormattedComment()
	{
		log.info 'getCommentString'
		def commentString = null
		if (comments)
		{
			commentString = "${comments.size()} comment"
			if (comments.size() > 1) 
			{
				commentString = commentString + 's'
			}
		}
		else commentString = '0 comments'
		log.info(commentString)
		return commentString
	}

    def getSortedComments()
    {
        Comment.findAllByEntry(this, [sort:'created', order:'asc'])
    }
}

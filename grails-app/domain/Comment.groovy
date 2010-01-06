class Comment {
	static belongsTo = Entry
	
	Entry entry
	
	String author = 'Your name'
	Date created = new Date()
	String content = 'Plain text only'
	
	static constraints = {
		entry(nullable:false)
                author(blank:false)
		content(widget:'textarea', blank:false, maxSize:10000)
		created()
	}
	
	def getFormattedCreated()
	{
		//log.info(this.entry?.id)
		def difference = this.created.getTime() - entry.created.getTime()
		
		def secs = Math.floor(difference/1000);
		log.info "seconds difference: ${secs}"
		
		if (secs < 1800) //30 minutes
		{
			return 'A few minutes later'
		} 
		else
		{
			def days = 0 
			def hours = 0
			def minutes = 0
			def seconds = 0
			
			if (secs >= 86400)
			{
				days = Math.floor(secs/86400).intValue()
			} else days = 0
			
			if ( (secs - (days * 86400)) >= 3600)
			{
				hours = Math.floor((secs - (days * 86400)) / 3600).intValue()
			} else hours = 0
			
			if ( (secs - (hours * 3600) - (days * 86400)) >= 60)
			{
				minutes = Math.floor((secs -(hours * 3600) - (days * 86400)) / 60).intValue()
			} else minutes = 0
						
			//seconds = secs - (minutes * 60) - (hours * 3600) - (days * 86400)
			//seconds = seconds.intValue()
			
			log.info("days '$days' hours '$hours' minutes '$minutes'")
			
			StringBuffer timeString = new StringBuffer()
			if (days > 0) {
				timeString.append ("$days day")
				if (days > 1) timeString.append('s')
			}
			
			if (hours > 0) {
				if (days>0) timeString.append(', ')
				timeString.append ("$hours hour")
				if (hours > 1) timeString.append('s')
			}

			/*if (minutes > 0) {
				if (days>0 || hours>0) timeString.append(', ')
				timeString.append ("$minutes minute")
				if (minutes > 1) timeString.append('s')
			}*/
			
			return timeString.toString() + " later"
		}
	}
}

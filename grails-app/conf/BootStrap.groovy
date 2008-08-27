class BootStrap {

     def init = { servletContext ->
     
     	def entries = []
     	entries << [1, 6014431, 2006, 8, 6]
     	entries << [2, 12916191, 2006, 8, 11]
     	entries << [3, 12001489, 2006, 8, 18]
     	entries << [4, 15770325, 2006, 8, 20]
     	entries << [5, 7846158, 2006, 8, 25]
     	entries << [6, 11233092, 2006, 9, 1]
     	entries << [7, 17905804, 2006, 9, 15]
     	entries << [8, 22656384, 2006, 9, 22]
     	entries << [9, 10340863, 2006, 9, 29]
     	entries << [10, 12821126, 2006, 10, 6]
     	entries << [11, 13711071, 2006, 10, 13]
     	entries << [12, 11757060, 2006, 10, 20]
     	entries << [13, 7765152, 2006, 10, 27]
     	entries << [14, 25902801, 2006, 11, 3] ///TODO
     	entries << [15, 3109964, 2006, 11, 10]
     	entries << [16, 39317668, 2006, 11, 10]
     	entries << [17, 27108447, 2006, 11, 17]
     	entries << [18, 12802340, 2006, 11, 24]
     	entries << [19, 12212013, 2006, 12, 1]
     	entries << [20, 11370889, 2006, 12, 8]
     	entries << [21, 8423591, 2006, 12, 15]
     	entries << [22, 13215869, 2007, 1, 11]
     	entries << [23, 25325559, 2007, 1, 19]
     	entries << [24, 9532224, 2007, 1, 23]
     	entries << [25, 38822040, 2007, 1, 31]
     	entries << [26, 12302548, 2007, 2, 8]
     	entries << [27, 35379909, 2007, 2, 15]
     	entries << [28, 6451117, 2007, 2, 22]
     	entries << [29, 14474033, 2007, 2, 28]
     	entries << [30, 30546857, 2007, 3, 9]
     	entries << [31, 30575275, 2007, 3, 18]
     	entries << [32, 17304114, 2007, 3, 26]
     	entries << [33, 10454243, 2007, 4, 5]
     	entries << [34, 14487462, 2007, 4, 8]
     	entries << [35, 12420327, 2007, 4, 15]
     	entries << [36, 22470856, 2007, 4, 29]
     	entries << [37, 11185031, 2007, 5, 12]
     	entries << [38, 6185486, 2007, 5, 27]
     	entries << [39, 9958665, 2007, 6, 17]
     	entries << [40, 15524294, 2007, 6, 23]
     	entries << [41, 17157819, 2007, 7, 15]
     	entries << [42, 12751018, 2007, 8, 11]
     	entries << [43, 10652762, 2007, 9, 17]
     	entries << [44, 10117017, 2007, 9, 22]
     	entries << [45, 5320137, 2007, 9, 26]
     	entries << [46, 3230555, 2007, 10, 5]
     	entries << [47, 4786901, 2007, 10, 10]
     	entries << [48, 4801356, 2007, 10, 17]
     	entries << [49, 23224324, 2008, 3, 2]
     	entries << [50, 19147223, 2008, 3, 18]
     	entries << [51, 27544281, 2008, 3, 30]
     	entries << [52, 26655459, 2008, 4, 13]
     	entries << [53, 29624266, 2008, 4, 27]
     	entries << [54, 16799620, 2008, 5, 10]
     	entries << [55, 30012999, 2008, 5, 11]
     	entries << [56, 11304744, 2008, 5, 25]
     	entries << [57, 21784251, 2008, 5, 27]
     	entries << [58, 22953193, 2008, 6, 9]
     	entries << [59, 34264031, 2008, 6, 22]
     	entries << [60, 22562103, 2008, 7, 5]
     	entries << [61, 35557969, 2008, 7, 20]
     	entries << [62, 29943589, 2008, 8, 4]
     	entries << [63, 27780657, 2008, 8, 17]
     	
	     if (Entry.count() == 0)
	     {
    	   	entries.each 
    	   	{ entry ->
    	   		def date = new GregorianCalendar(entry[2], entry[3]-1, entry[4]).getTime()
	    		def e = new Entry(
				 	title:"Grails Podcast Episode ${entry[0]}", 
				 	content:'', 
				 	created:date, 
				 	tags:'groovy grails',
				 	enclosureURL:"http://hansamann.podspot.de/files/grails_podcast_episode_${entry[0]}.mp3",
				 	enclosureLength:entry[1]	 
	    		 ).save()
	     		
	     	
	     	
	     	}
	    	 
	    	 
	    	 /*(1..63).each
	    	 {
	    		 def e = new Entry(
	    				 	title:"Grails Podcast Episode ${it}", 
	    				 	content:getContent(it), 
	    				 	created:new Date().minus((63-it)*14), 
	    				 	tags:'groovy grails',
	    				 	enclosureURL:"http://hansamann.podspot.de/files/grails_podcast_episode_${it}.mp3",
	    				 	enclosureLength:0    		 
	    		 ).save()
	    	 }*/
	     }
     
     	
	     if (AuthenticationUser.count() == 0)
	     {
	    	 new AuthenticationUser(login:'hansamann', password:'5434DAD493D7B0F3281860E3EEA5EAC2', email:'hansamann@yahoo.de', status:1).save()
	    	 new AuthenticationUser(login:'glen.smith', password:'354083264AFF0A94E404F1F4E5DE5EFD', email:'glen.smith@gmail.com', status:1).save()
	    	 new AuthenticationUser(login:'grailspodcast', password:'', email:'grails.podcast@gmail.com', status:1).save()
	     }
	     
     }
     def destroy = {
     }
     
     def getContent(number)
     {
    	 """This is content number ${number}, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number ${number}, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number ${number}, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number ${number}, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!"""
    	 
     }
     
     def getCommentContent(number)
     {
    	 """This is comment number ${number}, a very long comment entry. I cannot stop writing
bullshit, I just cannot stop. Bla bla bla this is a comment and you will like it so much."""
    	 
     }     
} 
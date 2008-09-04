import org.codehaus.groovy.grails.commons.ConfigurationHolder
import com.sun.syndication.feed.synd.SyndImageImpl
import grails.converters.JSON
import java.util.GregorianCalendar
import java.text.SimpleDateFormat
import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.GrailsApplication

class BlogController {
	def jcaptchaService
	def twitterService
	
    def index = { redirect(action:list,params:params) }
    
    def list = {
			log.info('list Action')
    		
            if(!params.max) params.max = 10
            params.order = "desc"
            params.sort = "created"
            [ entries: Entry.findAllByCreatedLessThan( getNow(), params ), now:getNowString() ]
            //[ entries: Entry.listOrderByCreated( params ), now:getNowString() ]
    }
	
	def newComment = {
			log.info('newComment Action')
			
			 if (jcaptchaService.validateResponse("imageCaptcha", session.id, params.captcha))
		     {
				 def comment = new Comment(params)
				 comment.created = getNow()
			     def entry = Entry.get(params.entry.id)
			     entry.addToComments(comment)
				 log.info("errors? ${comment.hasErrors()}")
				 log.info("entry id: ${comment.entry.id}")
				 
				 if(!comment.hasErrors() && comment.save()) {
					 
		                if (GrailsUtil.environment != GrailsApplication.ENV_DEVELOPMENT)
		                {
		                	try
		    	            {	
		    	            	twitterService.announceComment(entry)
		    	            } catch (Exception e)
		    	            {
		    	            	log.warn('Unable to send comment twitter message', e)
		    	            }
		                }
		                else
		                {
		                	log.info('Not sending twitter message in development')
		                } 					 
					 
					 render(contentType:"text/json") { 
						 ok(entryId:comment.entry.id)
					 }   
			     }
				 else
				 {
					 render(contentType:"text/json") { 
						 error(msg:'Please specify all input fields.')
					 } 					 
				 }
		     }
		     else
		     {
				 render(contentType:"text/json") { 
					 error(msg:'Captcha is not correct, please try again.')
				 } 
		     }

	}
    
    def id = {
			log.info('id action')
			def entry = Entry.get( params.id )
			render(view:"list",model:[ entries: entry, title:entry.title, now:getNowString() ])
    } 
    
    def tag = {
			log.info('tag action')
			params.order = "desc"
            params.sort = "created"
			render(view:"list",model:[ entries: Entry.findAllByTagsLike("%${params.id}%", params), now:getNowString() ])
    		
    }
	
	def rss = {
			def entries = Entry.findAllByCreatedLessThan( getNow(), [order:'desc', sort:'created'] );
			def linkBase = 'http://www.grailspodcast.com/'
			def desc = "This podcast will keep you up to date about Groovy and the Grails Web Application Framework. Shows delivered right into your favourite podcatcher include news about Grails and Groovy, Interviews with key developers and much more. E-Mail grails.podcast@gmail.com for feedback and inclusion into the show."
			def imageURL = 'http://gspot.morphexchange.com/images/gspot/grails_podcast_logo.jpg'
			
			def podcastImage = new SyndImageImpl()
			podcastImage.url = imageURL
			podcastImage.title = "Grails Podcast"
			podcastImage.link = "http://www.grailspodcast.com"
			
			render(feedType:"rss", feedVersion:"2.0") 
			{
	            title = "gSpot - The Groovy & Grails Podcast"
	            link = "http://www.grailspodcast.com"
	            description = desc
	            language = "en-gb"
	            copyright = "Glen Smith, Sven Haiges"
	            image = podcastImage
	            iTunes 
	            {
	                summary = desc
	                keywords = ['groovy', 'grails', 'java']
	                categories = [ "Technology" ]
	                image = new URL("http://docs.codehaus.org/download/attachments/62313/grails_podcast_logo.jpg") // later
	                author = "Glen Smith, Sven Haiges"
	                subtitle = "Stay up to date with Groovy and Grails"
	                explicit = false 
	                ownerName = "Glen Smith, Sven Haiges"
	                ownerEmailAddress = "grails.podcast@gmail.com"
	            }

	            entries.each { blogEntry ->
	            	entry(blogEntry.title) 
	            	{
	            		link = "${linkBase}blog/id/${blogEntry.id}"
	            		publishedDate = blogEntry.created
	            		author = "Glen Smith, Sven Haiges"
	            		
	            		content() 
	            		{
	            			type = "text/html"
	            			blogEntry.content //returns the content
	            		}
	            		enclosure 
	            		{
	            			type=blogEntry.enclosureType
	            			length=blogEntry.enclosureLength
	            			url=blogEntry.enclosureURL
	            		}
	            		
	            	}
	            	
	            }
			} 			
			
	}
    
    private String getNowString()
    {
		def dateFormat = new SimpleDateFormat("EEE, MMM d, yyyy - HH:mm")
		def nowString = dateFormat.format(getNow());     	
    	return nowString;
    }
	
	private Date getNow()
	{
		return new Date(new Date().time - 7 * 60 * 60 * 1000) // - 7 hours
		
	}
	
	def dynamicWeather= {
			log.info('dynamicWeather()')
			rss()
			//temperature
			def nowTemp =  servletContext.weather.channel.item.'yweather:condition'.@temp.text()
			def nowCondition = servletContext.weather.channel.item.'yweather:condition'.@text.text()
			
			//curent weather image
			def description = servletContext.weather.channel.item.description.text()
			def nowImageURL = description.substring(description.indexOf('<img src="')+10, description.indexOf('gif"/>')+3)
			
			
			//forecast
			def tomorrow = servletContext.weather.channel.item.'yweather:forecast'[1]
			def tomorrowDay = tomorrow.@day.text()
			def tomorrowCondition = tomorrow.@text.text()
			def tomorrowLow = tomorrow.@low.text()
			def tomorrowHigh = tomorrow.@high.text()
			
			
			//get sunrise/sunset time from feed
	    	def astro = servletContext.weather.channel.'yweather:astronomy'
	    	def sunriseTime = astro.@sunrise.text().split(' ')[0].split(':')
	    	log.info("sunriseTime ${sunriseTime}" )
	    	def sunsetTime = astro.@sunset.text().split(' ')[0].split(':')
	    	log.info("sunsetTime ${sunsetTime}" )
	    	
	    	//day or night
			def c = new GregorianCalendar()
			c.setTimeInMillis(new Date().time - 7 * 60 * 60 * 1000)
			def sunrise = new GregorianCalendar(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE), Integer.parseInt(sunriseTime[0]), Integer.parseInt(sunriseTime[1]))
			def sunset = new GregorianCalendar(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE), Integer.parseInt(sunsetTime[0])+12, Integer.parseInt(sunsetTime[1]))
	    				
			def dayOrNight
			if (c.before(sunrise) || c.after(sunset))
			{
			    dayOrNight = 'night'
			    println "it is dark outside"
			} 
			else
			{
			    dayOrNight = 'day'
			    println "it is light ouside" 
			}
			
			
			def weather = [	
			               	nowTemp:Integer.parseInt(nowTemp),
							nowCondition:nowCondition,
							nowImageURL:nowImageURL,
							tomorrow : [
								day:tomorrowDay,
								condition:tomorrowCondition,
								low:Integer.parseInt(tomorrowLow),
								high:Integer.parseInt(tomorrowHigh)
							],
							sunrise:[
							         hour:Integer.parseInt(sunriseTime[0]),
							         minute:Integer.parseInt(sunriseTime[1])
							],
							sunset: [
							         hour:Integer.parseInt(sunsetTime[0])+12,
							         minute:Integer.parseInt(sunsetTime[1])
							],
							dayOrNight:dayOrNight			
				]

			render weather as JSON
	}
	
	def rss() {
		fetchWeatherRss('94085')
	}
	
	def fetchWeatherRss(zip)
	{
		log.info('fetchWeatherRss()')
		def tenMinutesAgo = new Date(new Date().time - (1000 * 60 * 10))
		if (!servletContext.weather || servletContext.lastUpdate.before(tenMinutesAgo))
    	{
    		log.info('Updating weather RSS!')
			servletContext.weather = new XmlSlurper().parse("http://weather.yahooapis.com/forecastrss?p=${zip}&u=c").declareNamespace(yweather: 'http://xml.weather.yahoo.com/ns/rss/1.0')
    		//servletContext.weather = new XmlSlurper().parse("http://weather.yahooapis.com/forecastrss?p=ASXX0023&u=c").declareNamespace(yweather: 'http://xml.weather.yahoo.com/ns/rss/1.0')
			servletContext.lastUpdate = new Date();
    	}
		else
		{
			log.info('No Update necessary, using existing RSS text')
		}
		
	}
}

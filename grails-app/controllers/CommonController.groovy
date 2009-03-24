import org.codehaus.groovy.grails.commons.ConfigurationHolder
import grails.converters.JSON
import java.util.GregorianCalendar
import java.text.SimpleDateFormat

class CommonController {

    def index = { render "Not implemented." }

	def dynamic= {
			log.info('dynamic()')
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
			c.setTimeInMillis(getNow().time)
			def sunrise = new GregorianCalendar(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE), Integer.parseInt(sunriseTime[0]), Integer.parseInt(sunriseTime[1]))
			def sunset = new GregorianCalendar(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE), Integer.parseInt(sunsetTime[0])+12, Integer.parseInt(sunsetTime[1]))

			def dayOrNight
			if (c.before(sunrise) || c.after(sunset))
			{
			    dayOrNight = 'night'
			    log.debug "it is dark outside"
			}
			else
			{
			    dayOrNight = 'day'
			    log.debug "it is light ouside"
			}


			def data = [
			               	now:getNowString(),
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



			render data as JSON
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


    private String getNowString()
    {
		def dateFormat = new SimpleDateFormat("EEE, MMM d, yyyy - HH:mm")
		def nowString = dateFormat.format(getNow());
    	return nowString;
    }
	/* this returns sunnyvale time, only used for header display. rest uses UTC */
	private Date getNow()
	{
		return new Date(new Date().time - 8 * 60 * 60 * 1000) // - 7 hours (8DST)

	}
}

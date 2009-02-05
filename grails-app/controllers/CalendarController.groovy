import net.fortuna.ical4j.util.Calendars
import net.fortuna.ical4j.model.component.VEvent
import java.text.SimpleDateFormat


class CalendarController {

    def index = { redirect(action:'list', params:params) }

    def list = {

    def url = 'http://www.google.com/calendar/ical/jds6o8imt8qgtepchsmr72jhf4%40group.calendar.google.com/public/basic.ics'.toURL()
    def cal = Calendars.load(url)

    //println "Remark: ${cal.getProperty('X-WR-CALDESC').value}"

    //def tz = TimeZone.getTimeZone("America/Los_Angeles")

    def dayFormatter = new SimpleDateFormat("EEEEEEEE, MMMMMMMM dd'th' yyyy", Locale.US)
    def timeFormatter = new SimpleDateFormat('HH:mm', Locale.US)
    //timeFormatter.timeZone = tz

    def dates = []
    def now = new Date() //calculate correct now for Sunnyvale
    log.debug("Total components in iCal file: ${cal.components.size()}" )

    cal.components.findAll {it.startDate.date.time > now.time }.sort { it.startDate.date }.each
    {
      if (!it instanceof VEvent)
      {
        log.warn("Found event of class ${it.getClass()}, skipping!")
        return;
      }

      def startDate = dayFormatter.format(it.startDate.date)
      def startTime = timeFormatter.format(it.startDate.date)

      def eventMap = [
              startDate : startDate,
              startTime : startTime,
              location : (it.location.value) ? it.location.value : 'No Location',
              summary : it.summary.value,
              description : it.description.value
      ]

      dates << eventMap
    }


      [ dates : dates]
    }

}

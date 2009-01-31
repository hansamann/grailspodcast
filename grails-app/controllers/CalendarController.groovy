import java.text.SimpleDateFormat
import net.fortuna.ical4j.model.DateTime
import net.fortuna.ical4j.model.component.VEvent
import net.fortuna.ical4j.util.Calendars

class CalendarController {

    def index = { redirect(action:'list', params:params) }

    def list = {

            [ now:getNowString() ]
    }

      //TODO all reused methds in superclass or service?
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

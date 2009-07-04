<html>
    <head>
        <meta name="layout" content="blog" />
		<title>Groovy Event Calendar</title>
    </head>
    <body id="body">

         <div class="entry">
           <strong>Please note:</strong> the following event dates are local to the timezone PDT (US/San Francisco). It's great for an
           overview but to follow the events in your local time zone, we recommend you subscribe to the
           <a href="http://www.google.com/calendar/embed?src=jds6o8imt8qgtepchsmr72jhf4%40group.calendar.google.com&ctz=America/Los_Angeles">Groovy Event Calendar</a> at Google.
           directly. The events are <a href="http://snipplr.com/view/11770/parse-events-from-ical-url-or-file-eg-google-calendar/">parsed from the public Google iCal URL</a> of the calendar.
         </div>
    
		 <g:each in="${dates}" var="event">
           <div class="entry">
              <div class="meta">
                  <span class="left">${event.startDate}</span>
                ${event.location}
              </div>
              <div class="title">
                ${event.summary}
              </div>
              <div class="content">
                ${event.description}
              </div>
           </div>
         </g:each>

    </body>
</html>

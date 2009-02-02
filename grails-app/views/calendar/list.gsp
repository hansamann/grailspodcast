<html>
    <head>
        <meta name="layout" content="blog" />
		<title>Groovy Event Calendar</title>
    </head>
    <body id="body">

		 <g:each in="${dates}" var="event">
           <div class="entry">
             StartDate: ${event.startDate}<br/>
             Summary: ${event.summary}<br/>
             StartTime: ${event.startTime}<br/>
             Location: ${event.location}<br/>
             Description: ${event.description}
           </div>
         </g:each>

    </body>
</html>

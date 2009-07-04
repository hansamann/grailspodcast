<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="iphone" />
    <title>m.grailspodcast.com</title>
  </head>
  <body>

    <div class="toolbar">
      <h1 id="pageTitle"></h1>
      <a id="backButton" class="button" href="#"></a>
    </div>

    <ul id="episodes" title="grailspodcast" selected="true">
      <li><a href="http://feeds.grailspodcast.com/grailspodcast">Full RSS Feed</a></li>
      <g:render template="more"/>
    </ul>

</body> </html>
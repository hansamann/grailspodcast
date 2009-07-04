<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="blog" />
    <title>grailspodcast.com - Archives</title>
    <script src="http://feeds.feedburner.com/~s/grailspodcast" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="http://static.delicious.com/js/playtagger.js"></script>
  </head>
  <body id="body">

    <g:each in="${entries}" var="entry" status="i">
      <div class="${ (i % 2) == 0 ? 'smallEntry' : 'smallEntryRightSide'}">
        <div class="title">
          <%= link(controller:'blog', action:'id', id:entry.id ) { entry.title.encodeAsHTML() }%>
        </div>
      </div>
    </g:each>

  </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="blog" />
    <g:if test="${title}">
      <title>${title?.encodeAsHTML()}</title>
    </g:if>
    <script src="http://feeds.feedburner.com/~s/grailspodcast" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="http://static.delicious.com/js/playtagger.js"></script>
    <meta name="verify-v1" content="m4T3qEhWQnrgrSJ3lqqHqKsMthninFsWFiKc0pRvxQ8=" />
  </head>
  <body id="body">
    <g:if test="${flash.message}">
      <div class="blogMessage">
        ${flash.message}
      </div>
    </g:if>
    <g:render template="entries" bean="${entries}"/>
  </body>
</html>

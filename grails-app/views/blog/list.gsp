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

		<g:render template="entries" bean="${entries}"/>

        <div class="newcomment off" id="newComment">
            <g:form name="newCommentForm" method="post" action="newComment">
                <table class="layoutTable">
                <tr>
                    <td class="key">Your name:</td>
                    <td class="value"><input name="author" class="input" value=""/></td>
                </tr>
                </table>
                <textarea class="commentTextarea" name="content">plain text only</textarea>
                <div style="text-align:right;margin:1em 0;">
                    <input type="button" name="commentButton" id="commentButton" value="send" />
                    <input id="newCommentEntryId" type="hidden" name="entry.id" value=""/>
                </div>
            </g:form>
        </div>
   
    </body>
</html>

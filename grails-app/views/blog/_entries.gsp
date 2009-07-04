<g:each in="${entries}" var="entry">

  <div class="entry" id="entry${entry.id}">
    <div class="meta">
      <span class="left">${entry.humanReadableDate}</span>
${entry.formattedTags}

    </div>
    <div class="title">
<%= link(action:'id', id:entry.id ) { entry.title.encodeAsHTML() }%>
    </div>
    <div class="content">
${entry.content}
      <g:if test="${entry.enclosureURL}">
        <div class="enclosure"><a href="${entry.enclosureURL}">${entry.enclosureURL}</a></div>
      </g:if>
      <!-- class feedburnerFlareBlock in CSS -->
      <script src="http://feeds.feedburner.com/~s/grailspodcast?i=http://www.grailspodcast.com/blog/id/${entry.id}" type="text/javascript" charset="utf-8"></script>
    </div>
    <g:if test="${params.id}">
      <!-- show comments box on single entry view -->
      <g:form id="newCommentForm" name="newCommentForm" method="post" action="newComment">
        <input type="hidden" name="entry.id" value="${entry.id}"/>
        <table class="layoutTable">
          <tr>
            <td class="key">Name:</td>
            <td class="value" style="text-align:right;">
              <span style="float:left;">
                <input name="author" class="input" value="${fieldValue(bean:comment, field:'author')}"/>
              </span>
              <input type="submit" name="saveComment" value="add comment" />
            </td>
          </tr>
          <tr>
            <td colspan="2" style="border:0px;">
              <script>
              var RecaptchaOptions = {
                 theme : 'clean',
                 tabindex : 1
              };
              </script>
              <script type="text/javascript"
                      src="http://api.recaptcha.net/challenge?k=6LeuWgYAAAAAAGro3plDgD1RhCh5MPRx05v-aW1i">
              </script>
            </td>
          </tr>
        </table>
        <textarea class="commentTextarea" name="content">${fieldValue(bean:comment, field:'content')}</textarea>
      </g:form>
    </g:if>
    <div class="comments">
${entry.formattedComment} <g:if test="${!params.id}">&middot; <g:link action="id" id="${entry.id}">Create comment</g:link></g:if>
      <g:each in="${entry.sortedComments}" var="comment">
        <div class="comment">
          <strong>${comment.formattedCreated}</strong>, ${comment.author.encodeAsHTML()} wrote:<br/>
${comment.content.encodeAsHTML()}
        </div>
      </g:each>
    </div>
  </div>

</g:each>

<g:if test="${!params.id}">
  <div class="pagination">
    <g:paginate controller="blog" next="Next Page" prev="Previous Page" action="list" total="${Entry.count()}" />
  </div>
</g:if>
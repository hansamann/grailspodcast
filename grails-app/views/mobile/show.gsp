<%@ page contentType="text/html;charset=UTF-8" %>

<div id="details" class="panel" title="Details" style="left: 0pt;" selected="true">
  ${entry.content}
  <g:if test="${entry.enclosureURL}">
          <div class="enclosure" style="margin-top:1em;"><a href="${entry.enclosureURL}">Play ${entry.title.encodeAsHTML()}</a></div>
  </g:if>
</div>
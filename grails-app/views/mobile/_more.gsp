
      <g:each in="${entries}" status="i" var="entry">
      <li> <g:link action="show" id="${entry?.id}">${entry.title.encodeAsHTML()}</g:link></li>
      </g:each>

      <li>
        <%= link(action:'more', target:'_replace', params:[offset:offset+5] ) { 'Show 5 More Episodes…' }%>
      </li>
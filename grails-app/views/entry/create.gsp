

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <script src="http://yui.yahooapis.com/2.5.2/build/yuiloader/yuiloader-beta-min.js"></script>
        <g:javascript src="gspot/createEntry.js" />        
        <title>Create Entry</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" controller="blog" action="list">Home</g:link></span>
            <span class="menuButton"><g:link class="list" action="list">Entry List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Entry</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${entry}">
            <div class="errors">
                <g:renderErrors bean="${entry}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:entry,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:entry,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content">Content:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:entry,field:'content','errors')}">
                                    <textarea rows="5" cols="40" name="content" id="content">${fieldValue(bean:entry, field:'content')}</textarea>
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contentHTML">HTML Content:</label>
                                </td>
                                <td valign="top">
                                    <textarea rows="5" cols="40" name="contentHTML" id="contentHMTL">${fieldValue(bean:entry, field:'content')}</textarea>
                                </td>
                            </tr>   
                            
                           <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enclosure">Enclosure/Size:</label>
                                </td>
                                <td valign="top">
                                    <input type="text" id="enclosureURL" style="width:500px;" name="enclosureURL" value="${fieldValue(bean:entry,field:'enclosureURL')}"/><br/>
                                    <input type="text" id="enclosureLength" name="enclosureLength" value="${fieldValue(bean:entry,field:'enclosureLength')}"/>
                                    <g:select name="enclosureType" id="enclosureType" from="['audio/mpeg':'audio/mpeg']" value="${fieldValue(bean:entry,field:'enclosureType')}" 
                                    	optionKey="key" optionValue="value"/>
                                    
                                </td>
                            </tr>                                                          
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="created">Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:entry,field:'created','errors')}">
                                    <g:datePicker name="created" value="${entry?.created}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags">Tags:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:entry,field:'tags','errors')}">
                                    <input type="text" id="tags" name="tags" value="${fieldValue(bean:entry,field:'tags')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags">Twitter?</label>
                                </td>
                                <td valign="top" class="value">
                                  <g:checkBox name="twitter" value="${true}"/> Check to twitter this entry
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comments">Comments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:entry,field:'comments','errors')}">
                                    
<ul>
<g:each var="c" in="${entry?.comments?}">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="comment" params="['entry.id':entry?.id]" action="create">Add Comment</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

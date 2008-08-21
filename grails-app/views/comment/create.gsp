

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Comment</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" controller="blog" action="list">Home</g:link></span>
            <span class="menuButton"><g:link class="list" action="list">Comment List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Comment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${comment}">
            <div class="errors">
                <g:renderErrors bean="${comment}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author">Author:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:comment,field:'author','errors')}">
                                    <input type="text" id="author" name="author" value="${fieldValue(bean:comment,field:'author')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content">Content:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:comment,field:'content','errors')}">
                                    <textarea rows="5" cols="40" name="content">${fieldValue(bean:comment, field:'content')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="created">Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:comment,field:'created','errors')}">
                                    <g:datePicker name="created" value="${comment?.created}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="entry">Entry:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:comment,field:'entry','errors')}">
                                    <g:select optionKey="id" from="${Entry.list()}" name="entry.id" value="${comment?.entry?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="formattedCreated">Formatted Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:comment,field:'formattedCreated','errors')}">
                                    
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

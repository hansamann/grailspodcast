

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Comment List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" controller="blog" action="list">Home</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Comment</g:link></span>
        </div>
        <div class="body">
            <h1>Comment List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="author" title="Author" />
                        
                   	        <g:sortableColumn property="content" title="Content" />
                        
                   	        <g:sortableColumn property="created" title="Created" />
                        
                   	        <th>Entry</th>
                   	    
                   	        <g:sortableColumn property="formattedCreated" title="Formatted Created" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${commentList}" status="i" var="comment">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${comment.id}">${fieldValue(bean:comment, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:comment, field:'author')}</td>
                        
                            <td>${fieldValue(bean:comment, field:'content')}</td>
                        
                            <td>${fieldValue(bean:comment, field:'created')}</td>
                        
                            <td>${fieldValue(bean:comment, field:'entry')}</td>
                        
                            <td>${fieldValue(bean:comment, field:'formattedCreated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Comment.count()}" />
            </div>
        </div>
    </body>
</html>

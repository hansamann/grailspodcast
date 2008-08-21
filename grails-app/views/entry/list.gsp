

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Entry List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" controller="blog" action="list">Home</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Entry</g:link></span>
        </div>
        <div class="body">
            <h1>Entry List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <g:sortableColumn property="content" title="Content" />
                        
                   	        <g:sortableColumn property="created" title="Created" />
                        
                   	        <g:sortableColumn property="tags" title="Tags" />
                        
                   	        <th>Comments</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${entryList}" status="i" var="entry">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${entry.id}">${fieldValue(bean:entry, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:entry, field:'title')}</td>
                        
                            <td>${fieldValue(bean:entry, field:'content')}</td>
                        
                            <td>${fieldValue(bean:entry, field:'created')}</td>
                        
                            <td>${fieldValue(bean:entry, field:'tags')}</td>
                        
                            <td>${entry.comments.size()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Entry.count()}" />
            </div>
        </div>
    </body>
</html>

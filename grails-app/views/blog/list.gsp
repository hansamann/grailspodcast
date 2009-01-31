<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="bloglayout" />
     	<g:if test="${title}">
			<title>${title?.encodeAsHTML()}</title>
		</g:if>	        
        
        <script src="http://yui.yahooapis.com/2.5.2/build/yuiloader/yuiloader-beta-min.js"></script>
        <g:javascript src="gspot/gspot.js" />
        <script src="http://feeds.feedburner.com/~s/grailspodcast" type="text/javascript" charset="utf-8"></script>	
    </head>
    <body id="body">
        
	    <div class="headerWrap">
	   			<div class="header">
	       			<span class="left" id="weatherHeader"></span>
	       			${now}
	   			</div>
	   	</div>
    	
		<!-- #doc2 = 950px width, centered --> 
	    <div id="doc2" class="yui-t5">
	   		<div id="hd">
	   		<!-- header -->
		   		<g:link controller="blog">
		   			<img style="margin-top:40px;margin-bottom:10px;" src="${createLinkTo(dir:'images/gspot',file:'head_grailspodcast.png')}" alt="gSpot Sven Haiges" />
	   		 	</g:link>
	   		</div> 
	   		<div id="bd">
	   		<!-- body -->
	   		
		   		 <div id="yui-main">
	         	 	<div class="yui-b">
						<div class="yui-gf"> 
	         				<div class="yui-u first">	         				
	         				
                             <g:render template="left"/>
	         				
	         				</div> 
		         			<div class="yui-u" id="entryContent">
		         				
		         			<g:render template="entries" bean="${entries}"/>

		         			</div> 
		      			</div> 
	         	 	
	         	 	</div>
	      		 </div>
	      		
	      		<div class="yui-b">

                <g:render template="right" />

	      		</div>
   	
	   		
	   	  		
	   		</div> 
	   		<div id="ft">
	   		<!-- footer -->
	   		<div class="round">Grails Podcast 0.6 on Grails 1.0.4 | by <a href="http://hansamann.wordpress.com">Sven Haiges</a> and <a href="http://blogs.bytecode.com.au/glen">Glen Smith</a> | This blog is published under the <a href="http://creativecommons.org/licenses/by-nc/3.0/us/">Creative Commons Attribution-Noncommercial 3.0 License</a>. </div>
	   		</div> 
		</div>
   
   		<!-- twitter js -->
   		<script type="text/javascript" src="http://twitter.com/javascripts/blogger.js"></script>
		<script type="text/javascript" src="http://twitter.com/statuses/user_timeline/grailspodcast.json?callback=twitterCallback2&count=3"></script>			
   		<!-- twitter js -->
   		
        <div class="newcomment off" id="newComment">
            <g:form name="newCommentForm" method="post" action="newComment">
                <table class="layoutTable">
                <tr>
                    <td class="key">Your name:</td>
                    <td class="value"><input name="author" class="input" value=""/></td>
                </tr>
                <tr>
                    <td class="key">Verification:</td>
                    <td class="value"><input name="captcha" class="input" value="verify you're human"/>&nbsp;<jcaptcha:jpeg id="captcha" style="vertical-align:bottom;" name="imageCaptcha" height="23" width="100" /></td>
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

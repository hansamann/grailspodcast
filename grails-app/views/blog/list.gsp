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
	         				
		         				<!-- Start of Flickr -->
		         				<div class="section">special stuff</div>
				      			<div class="defaultContainer">
								    <g:link controller="blog" action="tag" id="interview">All Interviews</g:link><br/>
								    <g:link controller="blog" action="tag" id="groovyseries">All Groovy Series</g:link><br/> 
								    <g:link controller="blog" action="tag" id="groovyseries">All Getting Real</g:link><br/>
				      			</div>	
		         				
								<div class="flickr topSpace" id="flickr">
										
								</div>
								<!-- End of Flickr -->
	         				
	         				
	         				
	         				</div> 
		         			<div class="yui-u" id="entryContent">
		         				
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
			         					<div class="comments">
			         						${entry.formattedComment} &middot; <a id="createComment${entry.id}" href="#">Create comment</a>
			         						<g:each in="${entry.comments}" var="comment">
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
		         			</div> 
		      			</div> 
	         	 	
	         	 	</div>
	      		 </div>
	      		
	      		<div class="yui-b">
	      			<div class="section">search</div>
	      			<div class="defaultContainer">
					    <div id="autoCompleteSearch">
					        <input type="text" id="searchBox" value="search term"/>
					        <div id="searchContainer"></div>
					    </div>
	      			</div>	      			
	      			
	      			<div class="section topSpace">about</div>
	      			<div class="defaultContainer">
	      			The Grails Podcast is a bi-monthly podcast about the <a href="http://groovy.codehaus.org">Groovy</a> scripting language, the <a href="http://www.grails.org">Grails</a> 
	      			Web Framework and more. It is run by <a href="http://blogs.bytecode.com.au/glen">Glen Smith</a> from Canberra, Australia and <a href="http://hansamann.wordpress.com">Sven Haiges</a> from Sunnyvale, California.
	      			</div>
	      		
	      			<div class="section topSpace">feeds</div>
					<div class="defaultContainer">
						<a href="http://feeds.grailspodcast.com/grailspodcast" title="Subscribe to our feed" rel="alternate" type="application/rss+xml"><img src="http://www.feedburner.com/fb/images/pub/feed-icon16x16.png" alt="" style="border:0"/></a> <a href="http://feeds.grailspodcast.com/grailspodcast" title="Subscribe to our feed" rel="alternate" type="application/rss+xml">Subscribe in a reader</a><br/>
						<a href="http://www.feedburner.com/fb/a/emailverifySubmit?feedId=1798222&amp;loc=en_US">Subscribe by Email</a><br/>
					</div>
					
	      			<div class="section topSpace">social goodness</div>
					<div class="defaultContainer">
						<a href="http://www.flickr.com/search/?q=grailspodcast&m=tags">Flickr tag: 'grailspodcast'</a><br/>
						<a href="http://twitter.com/grailspodcast">Follow us on Twitter!</a><br/>
						<a href="http://digg.com/podcasts/Grails_Podcast">Digg us!</a><br/>
						<a href="mailto:grails.podcast@gmail.com">grails.podcast@gmail.com</a><br/>
						<a href="callto:+14083319118">Voicemail: +1 408 3319 118</a>
					</div>					
	      		
	      			<div class="section topSpace">updates</div>
	      			<!-- start twitter -->
					<div class="twitter">
					<ul id="twitter_update_list"></ul>
					</div>
	         		<!-- end twitter -->
	         		
	      			<div class="section topSpace">our sponsors</div>
					<div class="defaultContainer center">
						<img src="${createLinkTo(dir:'images/gspot',file:'sponsor.png')}"/>
					</div>		         		
	         		
	         		<div class="section topSpace">del.icio.us</div>	
	      			<!-- del.icio.us -->
	      			<div class="delicious">	
						<script type="text/javascript" src="http://feeds.delicious.com/v2/js/tags/hansamann?title=%20&count=70&sort=alpha&flow=cloud&name&showadd&color=BBBBBB-000000&size=12-24"></script>
	      			</div>
	      			<!-- del.icio.us -->	
	      		</div>
   	
	   		
	   	  		
	   		</div> 
	   		<div id="ft">
	   		<!-- footer -->
	   		<div class="round">Grails Podcast 0.2 on Grails 1.0.3 | by <a href="http://hansamann.wordpress.com">Sven Haiges</a> and <a href="http://blogs.bytecode.com.au/glen">Glen Smith</a> | This blog is published under the <a href="http://creativecommons.org/licenses/by-nc/3.0/us/">Creative Commons Attribution-Noncommercial 3.0 License</a>. </div>
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
														<td class="value"><input name="captcha" class="input" value="verify you're human"/><jcaptcha:jpeg id="captcha" style="vertical-align:bottom;" name="imageCaptcha" height="23" width="100" /></td>
													</tr>
													</table>
													<textarea class="commentTextarea" name="content">plain text only</textarea>
													<div style="text-align:right;margin:1em 0;">
														<input type="button" name="commentButton" id="commentButton" value="click me" />
														<input id="newCommentEntryId" type="hidden" name="entry.id" value=""/>
													</div>	
												</g:form>
			         						</div>  		
   
    </body>
</html>

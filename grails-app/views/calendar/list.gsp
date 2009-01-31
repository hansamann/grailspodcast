<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="bloglayout" />

		<title>grailspodcast.com ::: Groovy Event Calendar</title>
        
        <script src="http://yui.yahooapis.com/2.5.2/build/yuiloader/yuiloader-beta-min.js"></script>
        <g:javascript src="gspot/gspot.js" />
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
	         				
                             <g:render template="/blog/left"/>
	         				
	         				</div> 
		         			<div class="yui-u" id="entryContent">
		         				
		         			nothing yet

		         			</div> 
		      			</div> 
	         	 	
	         	 	</div>
	      		 </div>
	      		
	      		<div class="yui-b">

                <g:render template="/blog/right" />

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
   		
    </body>
</html>

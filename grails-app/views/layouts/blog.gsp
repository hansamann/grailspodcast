<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title><g:layoutTitle default="grailspodcast.com - The Groovy &amp; Grails Podcast" /></title>
    <link rel="shortcut icon" href="${createLinkTo(dir:'images/gspot',file:'favicon.ico')}" type="image/x-icon" />
    <script src="http://yui.yahooapis.com/2.5.2/build/yuiloader/yuiloader-beta-min.js"></script>
    <g:javascript src="gspot/gspot.js" />
    <g:layoutHead />
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'blog.css')}" />
    <link href="http://feeds.grailspodcast.com/grailspodcast" rel="alternate" type="application/rss+xml" title="Grails Podcast Feed" />
  </head>
  <body class="yui-skin-sam">

    <div class="headerWrap">
      <div class="header">
        <span class="left" id="weatherHeader"></span>
        <span id="now"></span>
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
                <g:render template="/layouts/left"/>
              </div>
              <div class="yui-u" id="content">
                <g:layoutBody />
              </div>
            </div>

          </div>
        </div>

        <div class="yui-b">

          <g:render template="/layouts/right" />

        </div>

      </div>
      <div id="ft">
        <!-- footer -->
        <div class="round">grailspodcast.com <g:meta name="app.version"/> on Grails <g:meta name="app.grails.version"/> | by <a href="http://hansamann.wordpress.com">Sven Haiges</a> and <a href="http://blogs.bytecode.com.au/glen">Glen Smith</a> | This blog is published under the <a href="http://creativecommons.org/licenses/by-nc/3.0/us/">Creative Commons Attribution-Noncommercial 3.0 License</a>. </div>
      </div>
    </div>

    <script type="text/javascript">
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
      try {
        var pageTracker = _gat._getTracker("UA-8635132-1");
        pageTracker._trackPageview();
      } catch(err) {}
    </script>

  </body>
</html>

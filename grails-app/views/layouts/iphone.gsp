<html>
    <head>
        <title><g:layoutTitle default="iPhone" /></title>
        <style type="text/css" media="screen">@import "${createLinkTo(dir:'js/iui',file:'iui.css')}";</style>
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
        <link rel="apple-touch-icon" href="${createLinkTo(dir:'images',file:'apple-touch-icon.png')}"/>
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="iui" />
        <g:javascript library="application" />				
    </head>
    <body>
        <g:layoutBody />

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
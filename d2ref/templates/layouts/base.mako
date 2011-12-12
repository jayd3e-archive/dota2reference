<%namespace name="header" file="header.mako"/>
<!-- base.mako --> 
<!DOCTYPE html>
<html>
    <head>
        <title>${title}</title>
        <link href="/static/css/styles.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="/static/js/jquery.js"></script>
        <script type="text/javascript" src="/static/js/init.js"></script>
        <script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
            </script>
            <script type="text/javascript">
            try{
            var pageTracker = _gat._getTracker("UA-25235423-1");
            pageTracker._trackPageview();
            } catch(err) {}
            </script>
    </head>
    <body>
        ${header.header(here)}
        ${self.body()}
    </body>
<html>
<%def name="header(here)">
    <a href="/index"><img src="/static/img/dota2logo.jpg" /></a>
    <a href="#top"><br /></a>
    
    <div id="topbar">
        <b style="float: left; margin: 5px 0 0 0;">
            % if here == '/':
                <a href="#heroes">Heroes</a>
                <a href="#items">Items</a>
            % endif

            % if mode != '':
                <a href="/index">Normal View</a>
                <a href="/index?mode=compact">Compact View</a>
            % endif
            
            % if text == 't':
                <a href="/index">Pictures</a>
                <a href="/index?text=t">Text-Only</a>
            % endif

            % if names == 't':
                <a href="/index">Hide Names</a>
                <a href="/index?names=t">Show Names</a>
                 <a href="/index?mode=hon">HoN Equivalents</a>
            % endif
        </b>
        
        <form style="margin: 0 0 0 3px; float: right; display: inline;" action="/index" method="get">
            <b style="color: #978370; font-family: arial, sans-serif;">Search:</b> 
            <input type="text" class="rounded" name="query" id="query"/></p>
            <input type="hidden" name="mode" id="mode" value="search" />
        </form>
    </div>
</%def>
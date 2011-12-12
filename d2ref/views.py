from datetime import datetime
from pyramid.view import view_config

class IndexViews(object):
    def __init__(self, request):
        self.request = request
        self.here = request.environ['PATH_INFO']
        self.matchdict = request.matchdict
        self.db = request.db

        # Header vars
        self.text = request.GET.get(['text'], None)
        self.mode = request.GET.get(['mode'], None)
        self.names = request.GET.get(['names'], None)
    
    @view_config(route_name='root', renderer='index/index.mako') 
    @view_config(route_name='index_root', renderer='index/index.mako')
    def index(self):
        title = "D2Ref"
        db = self.db

        if self.mode != '':
            if self.mode == 'compact':
                heroes = mysql_query("SELECT id, name, common_name, image, faction, roles, content, stat FROM heroes ORDER BY name")
            elif self.mode == 'hon':
                heroes = mysql_query("SELECT id, name, common_name, image, faction, roles, content, stat FROM heroes WHERE content LIKE '%HoN Equivalent%' ORDER BY name")
            elif self.mode == 'search':
                heroes = mysql_query("SELECT id, name, common_name, image, faction, roles, content, stat FROM heroes WHERE content LIKE '%$query%' OR name LIKE '%$query%' OR roles LIKE '%$query%' OR stat LIKE '%$query%' OR faction LIKE '%$query%' ORDER BY name")
        else:
            sql = mysql_query("SELECT id, name, common_name, image, faction, roles, content, stat FROM heroes ORDER BY stat")
            strength_heroes = mysql_query("SELECT id, name, common_name, image, faction, roles, content, stat FROM heroes WHERE stat = 'Strength' ORDER BY sort")
            agility_heroes = mysql_query("SELECT id, name, common_name, image, faction, roles, content, stat FROM heroes WHERE stat = 'Agility' ORDER BY sort")
            intel_heroes = mysql_query("SELECT id, name, common_name, image, faction, roles, content, stat FROM heroes WHERE stat = 'Intelligence' ORDER BY sort")

        return {'title':title,
                'here':self.here,
                'text':self.text,
                'mode':self.mode,
                'names':self.names}
    
    @view_config(route_name='index_root', renderer='index/text.mako', match_param="text=t")
    def index(self):
        title = "D2Ref Text"
        return {'title':title,
                'here':self.here,
                'text':self.text,
                'mode':self.mode,
                'names':self.names}
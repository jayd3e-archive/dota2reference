from pyramid.config import Configurator
from d2.models.base import initializeBase
from d2.models.comment import CommentModel
from d2.models.guide import GuideModel
from d2.models.guide_item import GuideItemModel
from d2.models.hero import HeroModel
from d2.models.item import ItemModel
from d2.models.user import UserModel
from d2ref.resources import Site
from d2ref.request import D2RefRequest
from sqlalchemy import engine_from_config
from sqlalchemy.orm import sessionmaker

def main(global_config, **settings):
        '''Main config function'''
        engine = engine_from_config(settings, 'sqlalchemy.')
        initializeBase(engine)
        # NOTE: A transaction is created by default in postgres, so I have added the
        # 'autocommit' kwarg so that I don't have to deal with transactions for
        # the moment.  Remove it once I have pyramid_tm & zope.sqlalchemy implemented.
        maker = sessionmaker(bind=engine, autocommit=True)
        settings['db.sessionmaker'] = maker
        
        config = Configurator(settings=settings,
                              root_factory=Site,
                              request_factory=D2RefRequest)
         
        config.add_static_view(name='static', path='d2ref:static')
                            
        config.add_route('root', '/')            
        #Handler Root Routes
        config.add_route('index_root', '/index')
        #Handler Action Routes
                          
        config.scan('d2ref')
        return config.make_wsgi_app()

if __name__ == '__main__':
    from paste.httpserver import serve
    serve(main(), host="0.0.0.0", port="5016")
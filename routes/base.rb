module Sinatra
  module NAME
    module Routing
      module Base
        def self.registered(app)
          home = lambda do
            @message = session[:tests]
            erb :index, :locals => { :users => User.all, :tests => session[:tests] }
          end

          app.get  '/', &home

          test = lambda do
            session[:tests] = params[:tests]
            redirect '/'
          end

          logoff = lambda do
            session[:nid] = nil
            session[:admin] = nil
            redirect '/'
          end

          app.get  '/', &home
          app.get  '/logoff', &logoff
          app.post  '/', &test
        end
      end
    end
  end
end

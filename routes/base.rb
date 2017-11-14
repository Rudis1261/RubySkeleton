module Sinatra
  module NAME
    module Routing
      module Base
        def self.registered(app)
          home = lambda do
            @message = session[:test]
            erb :index, :locals => { :users => User.all, :test => session[:test] }
          end

          app.get  '/', &home

          test = lambda do
            session[:test] = params[:test]
            puts "Received test data #{params[:test]}"
            redirect '/'
          end

          app.get  '/', &home
          app.post  '/', &test
        end
      end
    end
  end
end

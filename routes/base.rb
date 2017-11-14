module Sinatra
  module NAME
    module Routing
      module Base
        def self.registered(app)
          home = lambda do
            erb :index, :locals => { :users => User.all }
          end

          app.get  '/', &home
        end
      end
    end
  end
end

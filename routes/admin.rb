module Sinatra
  module NAME
    module Routing
      module Admin
        def self.registered(app)
          admin_login = lambda do
            erb :'admin/login'
          end

          admin = lambda do
            admin_required
            erb 'admin/index'
          end

          app.get '/admin/login', &admin_login
          app.get '/admin', &admin
        end
      end
    end
  end
end

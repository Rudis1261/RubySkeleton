module AdminRoutes
  def self.registered(app)
    admin_login = lambda do
      erb :'admin/login', locals: { :errors => [] }
    end

    attempt_login = lambda do
      errors = []
      if params[:username_or_email].empty? || params[:password].empty?
        if params[:username_or_email].empty?
          errors << 'No username / email provided'
          end
        if params[:password].empty?
          errors << 'No password provided'
        end
      end

      erb :'admin/login', locals: { :errors => errors }
    end

    admin_register = lambda do
      erb :'admin/register'
    end

    admin = lambda do
      admin_required
      erb 'admin/index'
    end

    app.get '/admin', &admin
    app.get '/admin/login', &admin_login
    app.post '/admin/login', &attempt_login
    app.get '/admin/register', &admin_register
  end
end
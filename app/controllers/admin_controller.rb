class AdminController < Sinatra::Base
    include Sprockets::Helpers
    include ApplicationHelpers

    set :views, File.expand_path('../../../views', __FILE__)

    get '/admin' do
      admin_required
      erb 'admin/index'
    end

    get '/admin/login' do
      erb :'admin/login', locals: { :errors => [] }
    end

    get '/admin/register' do
      erb :'admin/register'
    end

    post '/admin/login' do
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
end
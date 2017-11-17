class ApplicationController < Sinatra::Base
  include Sprockets::Helpers
  include AuthHelpers

  set :views, File.expand_path('../../../views', __FILE__)

  before do
    return if env["PATH_INFO"].to_s.include?('/assets/')
    return if env["PATH_INFO"].to_s.include?('/favicon')

    @user = User.sessionAuth(session[:user_id])
  end

  get  '/' do
    @message = session[:tests]
    erb :index, :locals => { :users => User.all, :tests => session[:tests] }
  end

  post '/' do
    session[:tests] = params[:tests]
    puts params[:tests]
    redirect '/'
  end

  get '/logoff' do
    session[:nid] = nil
    session[:admin] = nil
    session.clear
    redirect '/'
  end

  get '/login' do
    @redirect = params[:redirect] ||= false
    erb :'login', locals: { :errors => [], :error_message => false }
  end

  get '/register' do
    erb :'register'
  end

  post '/login' do
    errors = {}
    error_message = ''
    if params[:username_or_email].empty? || params[:password].empty?
      if params[:username_or_email].empty?
        errors << 'No username / email provided'
      end
      if params[:password].empty?
        errors << 'No password provided'
      end
      return erb :'login', locals: { :errors => errors, :error_message => error_message }
    end

    success, user = User.login(params)
    if !success || !user || !user.id
      errors << 'Login failed'
      return erb :'login', locals: { :errors => errors, :error_message => error_message }
    end

    session[:user_id] = user.id
    if params[:redirect]
      redirect params[:redirect]
    end
    redirect '/account'
  end
end
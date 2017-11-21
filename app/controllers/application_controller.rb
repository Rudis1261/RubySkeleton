class ApplicationController < Sinatra::Base
  include Sprockets::Helpers
  include AuthHelpers
  include ApplicationHelpers

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

  get '/logoff' do
    session[:nid] = nil
    session[:admin] = nil
    session.clear
    redirect '/'
  end

  get '/login' do
    @redirect = params[:redirect] ||= false
    erb :'login', locals: { :errors => {}, :error_messages => [] }
  end

  get '/register' do
    @redirect = params[:redirect] ||= false
    erb :'register', locals: { :errors => {}, :error_messages => [] }
  end

  post '/login' do
    errors = {}
    error_messages = []
    if params[:username_or_email].empty? || params[:password].empty?
      if params[:username_or_email].empty?
        errors['username_or_email'] = true
      end
      if params[:password].empty?
        errors['password'] = true
      end
      error_messages << 'Complete the fields'

      return erb :'login', locals: { :errors => errors, :error_messages => error_messages }
    end

    success, user = User.login(params)
    if !success || !user || !user.id
      error_messages << 'Login failed'
      return erb :'login', locals: { :errors => errors, :error_messages => error_messages }
    end

    session[:user_id] = user.id
    if params[:redirect]
      redirect params[:redirect]
    end
    redirect '/account'
  end
end
class ApplicationController < Sinatra::Base
  include Sprockets::Helpers
  set :views, File.expand_path('../../../views', __FILE__)

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
end
# Dependencies
require 'sinatra'
require 'sinatra/activerecord'
require 'sprockets'
require 'sprockets-helpers'
require 'uglifier'
require 'sass'

# Require all the things, models, routes
Dir['helpers/*.rb', 'models/*.rb', 'routes/*.rb'].each {|file| require_relative file }

# Main app
class NAME < Sinatra::Base
  set :sprockets, Sprockets::Environment.new(root)
  set :assets_prefix, '/assets'
  set :digest_assets, false
  set :static, true
  set :public_folder, 'static'
  set :views, 'views'
  set :session_secret, 'Super awesome secret, about the quick brown fox'
  enable :sessions

  set :root, File.dirname(__FILE__)

  # Routing
  register Sinatra::NAME::Routing::Base
  register Sinatra::NAME::Routing::Admin

  # Helpers
  helpers Sinatra::NAME::Helpers

  # Setup Sprockets
  configure do
    sprockets.append_path File.join(root, 'assets', 'stylesheets')
    sprockets.append_path File.join(root, 'assets', 'javascripts')
    sprockets.append_path File.join(root, 'assets', 'images')

    # Configure Sprockets::Helpers (if necessary)
    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.prefix      = assets_prefix
      config.digest      = digest_assets
      config.digest      = digest_assets
      config.public_path = public_folder

      # Force to debug mode in development mode
      # Debug mode automatically sets
      # expand = true, digest = false, manifest = false
      config.debug       = true if development?
    end
  end

  helpers do
    include Sprockets::Helpers

    # Alternative method for telling Sprockets::Helpers which
    # Sprockets environment to use.
    # def assets_environment
    #   settings.sprockets
    # end
  end

  # compress assets
  sprockets.js_compressor  = :uglify
  sprockets.css_compressor = :scss

  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.sprockets.call(env)
  end
end
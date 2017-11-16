require_relative './application_controller'

class AdminController < ApplicationController
    include Sprockets::Helpers
    include ApplicationHelpers

    get '/admin' do
      admin_required
      erb :'admin/index'
    end
end
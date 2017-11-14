require File.dirname(__FILE__) + '/spec_helper.rb'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.mock_with :rspec
end

describe NAME do
  let(:app) { NAME.new }

  context "Home Page" do
    let(:response) { get "/" }

    it "Should return the home page" do
      expect(response.status).to eq 200
    end

    it "Should contain" do
      expect(response.body).to include('RubySkeleton')
    end
  end

  context "Logoff" do
    #let(:response) { get "/logoff", {}, 'rack.session' => {:user_id => 9999} }
    let(:response) { get "/logoff" }

    it "Should redirect" do
      expect(response).to redirect_to "/"
    end
  end

  context "Admin Sections" do
    let(:response) { get "/admin" }

    it "Shoud redirect" do
      expect(response).to redirect_to "/admin/login"
    end
  end
end
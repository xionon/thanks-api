require 'test_helper'
require 'minitest/mock'

class SessionsControllerTest < ActionController::TestCase
  include Warden::Test::Helpers

  describe "#new" do
    before do
      warden_mock = Minitest::Mock.new
      warden_mock.expect(:message, nil)
      warden_mock.expect(:user, nil)
      @request.env['warden'] = warden_mock
    end

    it "responds to GET" do
      get :new
      assert_response :success
    end
  end

  describe "#create" do
    before do
      @user = FactoryGirl.create(:user)
      warden_mock = Minitest::Mock.new
      warden_mock.expect(:authenticate!, @user)
      @request.env['warden'] = warden_mock
    end

    it "redirects the user to the root path" do
      post :create, :email => @user.email, :password => "password"
      response.must_be :redirect?
      response.redirect_url.must_equal root_url
    end
  end
end

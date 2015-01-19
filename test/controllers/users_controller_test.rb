require 'test_helper'
require 'minitest/mock'

class UsersControllerTest < ActionController::TestCase
  describe "new" do
    before do
      @request.env['warden'] = Minitest::Mock.new.expect(:user, nil)
    end

    it "responds to GET" do
      get :new
      assert_response :success
    end
  end
end

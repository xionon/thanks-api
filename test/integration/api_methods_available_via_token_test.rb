require 'test_helper'

class ApiMethodsAvailableViaTokenTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  describe "create messages" do
    it "requires an api key" do
      key  = FactoryGirl.create(:api_key)
      user = FactoryGirl.create(:user, :api_keys => [key])

      post messages_path, {:message => { :body => "body text", :recipient => "recipient"}, :format => :json}
      response.code.must_equal "401"

      post messages_path, {:message => { :body => "body text", :recipient => "recipient"}, :token => key, :email => user.email}
      response.code.must_equal "200"
    end

    it "requires the parameters be signed by the api secret"
  end
end

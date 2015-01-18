require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  it "generates a key with a random token" do
    key = ApiKey.generate!

    key.token.wont_be_empty
    key.token.must_be_instance_of String
  end
end

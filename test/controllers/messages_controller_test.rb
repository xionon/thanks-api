require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  describe "#create" do
    it "creates new messages" do
      initial_message_count = Message.count

      post :create, { :message => { :body => "foobar", :recipient => "recieving-user" }}

      Message.count.must_equal initial_message_count+1
    end
  end
end

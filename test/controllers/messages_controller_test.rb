require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  describe "#create" do
    before do
      user = FactoryGirl.create(:user)
      warden_mock = Minitest::Mock.new
      warden_mock.expect(:user, user)
      warden_mock.expect(:authenticate!, user)
      @request.env['warden'] = warden_mock
    end

    it "creates new messages" do
      initial_message_count = Message.count

      post :create, { :message => { :body => "foobar", :recipient => "recieving-user" }}

      Message.count.must_equal initial_message_count+1
    end
  end
end

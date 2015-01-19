require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  it "requires a recipient" do
    m = Message.new
    m.wont_be :valid?
    m.errors[:recipient].wont_be :empty?
  end
end

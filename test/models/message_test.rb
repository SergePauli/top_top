require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "messages_count" do
    assert_equal 10, Message.count
  end

  test "message_create" do
    Message.create(user: users(:one), content: "test")
    message = Message.last
    assert_equal true, Message.count === 11 && message.content === "test" && message.user.name === "User0"
  end
end

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

  test "should not save message without user" do
    message = Message.new(content: "test")
    assert_not message.save, "saved message without user"
  end

  test "should not save message without content" do
    message = Message.new(user: users(:one))
    assert_not message.save, "saved message without content"
  end

  test "should not save message with empty content" do
    message = Message.new(user: users(:one), content: "")
    assert_not message.save, "saved message with empty content"
  end
end

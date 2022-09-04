require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "create message" do
    post "/message",
      params: { name: "User0", message: "test" }

    assert_equal "index", @controller.action_name
    assert_response :unauthorized

    assert_difference("Message.count") do
      post "/message", params: { name: "User0", message: "test" }, headers: { Authorization: "Bearer_#{JsonWebToken.generate_token(users(:one).id)}" }
    end

    assert_equal true, Message.where(content: "test").where(user: users(:one)).count === 1
  end

  test "get last ten messages" do
    post "/message",
      params: { name: "User1", message: "history 10" }
    assert_response :unauthorized

    post "/message",
      params: { name: "User1", message: "history 10" }, headers: { Authorization: "Bearer_#{JsonWebToken.generate_token(users(:two).id)}" }
    assert_response :ok
    assert_match "messages", @response.body
    assert_match '{"name":"User0","message":"Сообщение_0"}', @response.body
    assert_match '{"name":"User1","message":"Сообщение_9"}', @response.body
  end
end

require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "right route, and can't login with wrong password" do
    post "/login",
      params: { name: "User0", password: "test" }
    assert_equal "create", @controller.action_name
    assert_response :forbidden
  end

  test "can login" do
    post "/login",
      params: { name: users(:one).name, password: "pass0" }
    assert_response :ok
    assert_match "token", @response.body
    assert_match JsonWebToken.generate_token(users(:one).id), @response.body
  end
end

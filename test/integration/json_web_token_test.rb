require "test_helper"

class JsonWebTokenTest < ActionDispatch::IntegrationTest
  test "can generate token" do
    assert_equal users(:one).id, JsonWebToken.validate_token(JsonWebToken.generate_token(users(:one).id))
  end
  test "different token for different ID" do
    assert_equal false, users(:one).id === JsonWebToken.validate_token(JsonWebToken.generate_token(users(:two).id))
  end
  test "recognized expired token" do
    expired_token = JWT.encode({ data: users(:one).id, exp: 145.hours.ago.to_i }, Rails.application.secrets.secret_key_base)
    assert_equal (-1), JsonWebToken.validate_token(expired_token)
  end
end

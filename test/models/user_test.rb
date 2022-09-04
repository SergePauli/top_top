require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "users_count" do
    assert_equal 2, User.count
  end

  test "users_User0_login" do
    @user = User.where(name: "User0").first
    assert_equal true, !!@user && !!@user.authenticate("pass0")
  end

  test "users_User1_login" do
    @user = User.where(name: "User1").first
    assert_equal true, !!@user && !!@user.authenticate("pass1")
  end
end

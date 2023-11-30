require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create an account" do
    user = User.create(username: "john_doe", password: "password123")
    assert user.persisted?, "Failed to create an account"
  end

  test "cannot create an account without username" do
    user = User.new(password: "password123")
    assert_not user.save, "Account should not be saved without a username"
    assert_not user.valid?, "User should be invalid without a username"
    assert_not user.errors[:username].empty?, "Username should have a validation error"
  end

  test "cannot create an account without password" do
    user = User.new(username: "john_doe")
    assert_not user.save, "Account should not be saved without a password"
    assert_not user.valid?, "User should be invalid without a password"
    assert_not user.errors[:password].empty?, "Password should have a validation error"
  end

  test "can login to an account" do
    user = User.create(username: "john_doe", password: "password123")
    logged_in_user_id = User.login("john_doe", "password123")
    assert_equal user.id, logged_in_user_id, "Failed to login to an account"
  end

  test "cannot login with incorrect credentials" do
    user = User.create(username: "john_doe", password: "password123")
    logged_in_user_id = User.login("john_doe", "wrong_password")
    assert_nil logged_in_user_id, "Logged in with incorrect credentials"
  end
end

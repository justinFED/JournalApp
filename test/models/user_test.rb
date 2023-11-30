require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create an account" do
    user = User.create(username: "john_doe", password: "password123")
    assert user.persisted?, "create an account"
  end

  test "cannot create an account without username" do
    user = User.new(password: "password123")
    assert_not user.save, "invalid account without username"
  end

  test "cannot create an account without password" do
    user = User.new(username: "john_doe")
    assert_not user.save, "invalid account without password"
  end

  test "can login to an account" do
    user = User.create(username: "john_doe", password: "password123")
    logged_in_user_id = User.login("john_doe", "password123")
    assert_equal user.id, logged_in_user_id, "login to an account"
  end

  test "cannot login with incorrect credentials" do
    user = User.create(username: "john_doe", password: "password123")
    logged_in_user_id = User.login("john_doe", "wrong_password")
    assert_nil logged_in_user_id, "login with incorrect credentials"
  end
end

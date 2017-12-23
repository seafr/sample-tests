require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "Invalid signup information" do
    get signup_path			# Not necessary
    assert_no_difference 'User.count' do
      post users_path, user: { name: "", email: "user@invalid",
							 password: "foo", password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end
end

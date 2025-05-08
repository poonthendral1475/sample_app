require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "", email: "abc@example", password: "123", password_confirmation: "321" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
    post users_path, params: { user: { name: "poonthendral", email: "poonthendral@gmail.com", password: "123456", password_confirmation: "123456" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
end

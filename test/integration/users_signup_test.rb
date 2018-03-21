require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'Invalid Sign up details' do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
    post users_path, params: { user: { name:  "",
                                       email: "user@invalid",
                                       password:              "foo",
                                       password_confirmation: "bar" } }
    end
    assert_template 'users/new'

    assert_select "#error_explanation" do
      assert_select "li", 4
    end
    assert_select ".field_with_errors", 8
  end
end

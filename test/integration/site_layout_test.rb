require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "primay navigation links" do
    get root_path
    assert_template 'pages/home'
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    assert_select 'a[href=?]', signup_path
    get signup_path
    assert_select "title", full_title("Sign Up")
  end

  test 'signup page form' do
    get new_user_path
    assert_template 'users/new'
    assert_select 'input#user_name'
    assert_select 'input#user_email'
    assert_select 'input#user_password'
    assert_select 'input#user_password_confirmation'
    assert_select 'input[type="submit"]'
  end
end

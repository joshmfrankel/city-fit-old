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
    assert_select 'input#user_name', 1
    assert_select 'input#user_email', 1
    assert_select 'input#user_password', 1
    assert_select 'input#user_password_confirmation', 1
    assert_select 'input[type="submit"]', 1
  end

  test 'login form' do
    get login_path
    assert_template 'sessions/new'
    assert_select 'input#session_email', 1
    assert_select 'input#session_password', 1
    assert_select 'input[type="submit"]', 1

    # ? is a substitution and takes in the signup_path
    assert_select 'a[href=?]', signup_path, 2
  end
end

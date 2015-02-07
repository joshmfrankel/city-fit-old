require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test 'flash should only persist for single request' do
    get login_path
    assert_template 'sessions/new'
    assert_select 'input#session_email', 1
    assert_select 'input#session_password', 1
    assert_select 'input[type="submit"]', 1

    # ? is a substitution and takes in the signup_path
    assert_select 'a[href=?]', signup_path, 2

    # Post with invalid elements
    post login_path, session: {
      email: '',
      password: ''
    }

    assert_template 'sessions/new'
    assert_not flash.empty?

    # Goto another page
    get root_path
    assert_template 'pages/home'

    # No Flash message
    assert flash.empty?

  end
end

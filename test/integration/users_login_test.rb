require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  # Make sure new users are redirected to the proper page
  test "login with valid information followed by logout" do
    get login_path
    # use the fixture data
    post login_path, session: { email: @user.email, password: 'password' }

    # Check right redirect target
    assert_redirected_to @user

    # Then follow the redirect target
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    # Log out time
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

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

  test 'login with remembering' do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test 'login without remembering' do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end

require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'title', full_title("Sign Up")
    assert_select 'input#user_name'
    assert_select 'input#user_email'
    assert_select 'input#user_password'
    assert_select 'input#user_password_confirmation'
  end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  #   assert_select 'title', full_title("User Show")
  # end

end

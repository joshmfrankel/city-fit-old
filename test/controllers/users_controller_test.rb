require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'title', full_title("Sign Up")
  end

  test "should get show" do
    get :show, :id => 1
    assert_response :success
    assert_select 'title', full_title("User Show")
  end

end

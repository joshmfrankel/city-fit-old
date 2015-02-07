require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'invalid signup info' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {
        name: '',
        email: 'invalid@invalid...',
        password: 'foobar',
        password_confirmation: 'F@1'
      } # end post
      assert_template 'users/new'
    end
  end

  test 'valid signup info' do
    get signup_path
    # Assert a difference of 1 in the variable User.count from the block
    assert_difference 'User.count', 1 do

      # Post and follow redirect (redirect_to)
      post_via_redirect users_path, user: {
        name: 'Example',
        email: 'valid@valid.com',
        password: "ARealy31@",
        password_confirmation: "ARealy31@"
      }
    end
    assert_template 'users/show'
  end
end

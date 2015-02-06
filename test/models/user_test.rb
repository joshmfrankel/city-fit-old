require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # A simple fixtures test
  test "should get admin name josh" do

    # Grab the fixture data
    user = users(:Admin)
    assert_equal("Josh", user.name)
  end

  # Pre-runner
  def setup
    @user = User.new(name: 'Josh', email: 'joshmfrankel@gmail.com')
  end

  # Validations
  test 'should get valid user' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '     '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '     '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

end

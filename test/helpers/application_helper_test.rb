require 'test_helper'

class ApplicationHelperTest < ActionController::TestCase

  test 'full title helper' do
    assert_equal full_title, "CityFit: Solving couples two body problem"
    assert_equal full_title('About'), "About | CityFit: Solving couples two body problem"
  end

end

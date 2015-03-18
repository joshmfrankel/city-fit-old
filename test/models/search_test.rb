require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @search = @user.searches.build(job_title: "Lorem ipsum")
  end

  test "should be valid" do
    assert @search.valid?
  end

  test "user id should be present" do
    @search.user_id = nil
    assert_not @search.valid?
  end

  test "content should be present " do
    @search.job_title = "   "
    assert_not @search.valid?
  end

  test "content should be at most 140 characters" do
    @search.job_title = "a" * 141
    assert_not @search.valid?
    end

  test "order should be most recent first" do
    assert_equal Search.first, searches(:most_recent)
  end
end

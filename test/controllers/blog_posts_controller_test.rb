require "test_helper"

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Include Devise helpers

  setup do
    @blog_post = blog_posts(:one)
    @user = users(:one) # Load a user fixture
    sign_in @user       # Sign in the user before running the test
  end

  test "should get index" do
    get blog_posts_path
    assert_response :success
  end

  test "should get show" do
    get blog_post_path(@blog_post)
    assert_response :success
  end
end

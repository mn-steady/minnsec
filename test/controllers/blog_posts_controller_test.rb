require "test_helper"

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_post = blog_posts(:one) 
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

class HomeController < ApplicationController
  def index
    # Fetch published blog posts to show on the home screen
    @blog_posts = BlogPost.where(published: true)
  end
end

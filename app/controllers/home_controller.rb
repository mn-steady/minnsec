class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # Fetch published blog posts to show on the home screen
    @blog_posts = BlogPost.where(published: true)
  end
end


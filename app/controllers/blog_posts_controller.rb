class BlogPostsController < ApplicationController
  before_action :authenticate_user!, only: [ :index ]

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end
end

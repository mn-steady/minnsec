class BlogPostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :require_admin, only: [:new, :create]

  def index
    @blog_posts = BlogPost.order(created_at: :desc) # Display blog posts by newest first
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.user = current_user # Associate the blog post with the current user

    if @blog_post.save
      redirect_to blog_posts_path, notice: 'Blog post was successfully created.'
    else
      render :new
    end
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :published)
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end

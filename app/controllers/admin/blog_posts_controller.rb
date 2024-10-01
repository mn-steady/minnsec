module Admin
  class BlogPostsController < Admin::ApplicationController
    # Override the create action to assign the current user as the blog post's author
    def create
      blog_post = BlogPost.new(blog_post_params)
      blog_post.user = current_user # Assign the current logged-in admin user as the author

      if blog_post.save
        redirect_to admin_blog_post_path(blog_post), notice: "Blog Post was successfully created."
      else
        render :new
      end
    end

    # Override the update action if needed, similar to create
    def update
      blog_post = find_resource(params[:id])
      blog_post.user = current_user # Ensure the current user is associated on update as well

      if blog_post.update(blog_post_params)
        redirect_to admin_blog_post_path(blog_post), notice: "Blog Post was successfully updated."
      else
        render :edit
      end
    end

    private

    # Strong parameters for blog posts
    def blog_post_params
      params.require(:blog_post).permit(:title, :content, :published, :user_id)
    end
  end
end

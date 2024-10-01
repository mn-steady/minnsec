class AddUserIdToBlogPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :blog_posts, :user_id, :integer
  end
end

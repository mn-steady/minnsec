class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association with BlogPost
  has_many :blog_posts, dependent: :destroy

  def admin?
    admin # This will return true or false based on the admin attribute
  end
end

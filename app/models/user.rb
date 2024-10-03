class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association with BlogPost
  has_many :blog_posts, dependent: :destroy

  # Validations
  validates :first_name, :last_name, :display_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }

  # Custom password validation for complexity
  validate :password_complexity

  # Methods
  def admin?
    admin # This will return true or false based on the admin attribute
  end

  # Helper methods to display full name
  def full_name
    "#{first_name} #{last_name}"
  end

  private

  # Password complexity validation method
  def password_complexity
    return if password.blank? || password =~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W]).{8,}$/

    errors.add :password, "must include at least one lowercase letter, one uppercase letter, one digit, and one special character"
  end
end

class UserMailer < ApplicationMailer
  default from: "no-reply@minnsec.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to MinnSec")
  end
end

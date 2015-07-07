class UserMailer < ApplicationMailer

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "shit worked"
  end
end

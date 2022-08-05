class UserMailer < ApplicationMailer
  default from: Rails.application.credentials.dig(:mj, :SENDER_EMAIL)

  def new_user(user)
    @user = user.nickname
    @url = "http://localhost:3000"

    mail(to: user.email, subject: t(".welcome_new") + ": #{ user.email }")
  end

  def new_user_update(user)
    @user = user.nickname
    @url = "http://localhost:3000"

    mail(to: user.email, subject: t(".update_account") + ": #{ user.email }")
  end
end

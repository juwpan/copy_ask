class UserMailer < ApplicationMailer
  default from: Rails.application.credentials.dig(:mj, :SENDER_EMAIL)

  def new_user(user)
    @user = user
    @url = Rails.application.credentials.dig(:mj, :heroku_sait)

    mail(to: "#{user.name} <#{user.email}>", subject: "please_confirm_your_registration")
  end

  def new_user_update(user)
    @user = user
    @url = Rails.application.credentials.dig(:mj, :heroku_sait)

    mail(to: user.email, subject: t(".update_account") + ": #{ user.email }")
  end
end

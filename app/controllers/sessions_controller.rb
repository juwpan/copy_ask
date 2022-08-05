class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path, notice: I18n.t("controller.your_login")
    else
      flash.now[:alert] = I18n.t("controller.error_email_address_or_password")

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path notice: I18n.t("controller.you_are_log_out")
  end
end

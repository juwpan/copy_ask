class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    # debugger
    
    if user != nil && user.email_confirmed == true
      session[:user_id] = user.id
        
      redirect_to root_path, notice: t(".your_login")
    elsif user == nil
      flash[:alert] = t(".error_email_address_or_password")

      render :new
    elsif user != nil && user.email_confirmed == false
      flash[:alert] = t(".please_active_your_account")

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: t(".you_are_log_out")
  end
end

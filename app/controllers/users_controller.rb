class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]


  def new
    session[:current_time] = Time.now

    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      UserMailer.new_user(@user).deliver_now

      flash[:notice] = t(".registration_completed_successfully")
      
      redirect_to root_path
    else
      flash.now[:alert] = t(".registration_fields_filled_out_incorrectly")

      render :new
    end
  end

  def confirm_email
    @user = User.find_by(params[:confirm_token])

      if @user.email_confirmed == false
        @user.email_activate
        flash[:success] = t(".welcome")

        redirect_to root_path
      else
        flash[:alert] = t(".error") if @user.email_confirmed == false
        flash[:alert] = t(".success_confirmed_email") if @user.email_confirmed == true

        redirect_to root_path
      end
  end

  def update 
    if @user.update(user_params)
      UserMailer.new_user_update(@user).deliver_now

      redirect_to root_path, notice: I18n.t("controller.update_user_data")
    else
      flash.now[:alert] = I18n.t("controller.save_error")

      render :edit
    end
  end

  def edit
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: I18n.t("controller.account_deleted")
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    
    @question = Question.new(user: @user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation, :color
    )
  end

  def authorize_user
    redirect_with_alert unless current_user == @user
  end
end

class UsersController < ApplicationController

  def new
    session[:current_time] = Time.now

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      
      redirect_to root_path, notice: "Registration completed successfully"
    else
      flash.now[:alert] = "Registration fields filled out incorrectly"

      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: "Update user data"
    else
      flash.now[:alert] = "Save error"

      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: "Account deleted"
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation, :color
    )
  end
end

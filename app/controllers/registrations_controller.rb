class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      sign_in(user)
      redirect_to chatrooms_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end

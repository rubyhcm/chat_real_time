class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user
      sign_in(user)
      redirect_to chatrooms_path
    else
      flash[:error] = "Username doesn't exist"
      redirect_to login_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    reset_session
  end
end

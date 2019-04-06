class UsersController < ApplicationController
  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/users/new'
    else
      User.create(user_params)
      redirect_to '/home'
    end
  end
  def home
  end
  def new
    @user = User.new
  end
  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

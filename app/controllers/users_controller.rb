class UsersController < ApplicationController

  def new
    render '/'
  end

  def create
    # binding.pry
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end

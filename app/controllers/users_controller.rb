class UsersController < ApplicationController
  def new
  end

  def create
    puts params
    if params[:user][:name].nil? || params[:user][:name] == ""
      flash[:message] = "Username required!"
      redirect_to new_user_path
    elsif params[:user][:password].nil? || params[:user][:password].size < 8
      flash[:message] = "Password must be at least 8 characters long!"
      redirect_to new_user_path
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:message] = "Passwords must match!"
      redirect_to new_user_path
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

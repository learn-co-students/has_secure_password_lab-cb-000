class UsersController < ApplicationController

  def new

  end

  def home
      puts "hi #{@user.name}"
  end

  def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/welcome'
      else
        redirect_to new_user_url
      end
  end

  def welcome
    render 'welcome'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end

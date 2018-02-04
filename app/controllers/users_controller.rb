class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    if user_params.all? {|param, val| !val.empty?}
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to index_path
      else
        redirect_to signup_path
      end
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

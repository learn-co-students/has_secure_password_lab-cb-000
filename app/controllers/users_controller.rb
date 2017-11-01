class UsersController < ApplicationController
  before_action :set_user, only: [:show]

def show

end

def new
  @user = User.new
end

def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
end


private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

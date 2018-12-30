class UsersController < ApplicationController
  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @u = User.create(user_params)
      session[:user_id] = @u.id
    else
      redirect_to(controller:'users',action:'new')
    end
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end

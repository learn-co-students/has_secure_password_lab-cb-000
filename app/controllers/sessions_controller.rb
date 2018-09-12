class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    # binding.pry
    if !!@user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      session[:user_id] = nil
      redirect_to '/'
    end
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end


end

class SessionsController < ApplicationController

  def create
    user = User.find_by(name: sessions_params[:name])
    if user
      return head(:forbidden) unless user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      redirect_to index_path
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  private
  def sessions_params
    params.require(:user).permit(:name, :password)
  end
end

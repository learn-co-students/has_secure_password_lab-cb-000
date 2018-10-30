class SessionsController < ApplicationController

  def create
    if @user = User.find_by(username: params[:username])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/'
    end
  end

end

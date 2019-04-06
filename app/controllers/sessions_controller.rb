class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      return head(:forbidden)
    end
  end
end

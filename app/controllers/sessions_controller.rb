class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(name: params[:user][:name])
  	return head(:forbidden) unless @user.authenticate(params[:user][:password])
  	
    if @user
  	  session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to new_session_path
    end
  end
  
end

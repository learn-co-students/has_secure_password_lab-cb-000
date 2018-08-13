class SessionsController < ApplicationController

  def new  # Login Page
  end

  def create
    @user = User.find_by(user_params(:name))
    return head(:forbidden) unless @user.authenticate(user_params(:password)[:password])
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.clear
    redirect_to controller: 'sessions', action: 'new'
  end

end

class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to :controller => 'welcome', :action => 'home'
    else
      #something failed
      #is it better to use login_path from routes or keep it controller, action as you might not have/change a login route??
      redirect_to :controller => 'sessions', :action => 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end

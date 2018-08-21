class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:user][:name].nil? || params[:user][:name] == ""
      flash[:message] = "Username required!"
      redirect_to '/login'
    elsif params[:user][:password].nil? || params[:user][:password] == ""
      flash[:message] = "Password required!"
      redirect_to '/login'
    else
      @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        flash[:message] = "You are now logged in as #{params[:name]}"
        redirect_to '/'
      else
        flash[:message] = "Username or Password is incorrect!"
        redirect_to '/login'
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end

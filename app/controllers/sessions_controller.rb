class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to '/welcome'
    else
      redirect_to '/sessions/new'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end

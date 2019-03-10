class SessionsController < ApplicationController

  def new

  end

  def create
    # raise params.inspect
    user = User.find_by(params[:name])
    # binding.pry
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/index'
    else
      render '/sessions/new'
    end
  end

end

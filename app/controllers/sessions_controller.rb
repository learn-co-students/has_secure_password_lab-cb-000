class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by( name: params[:user][:name] )

    authenticated = user.try(:authenticate, params[:user][:password])

    if authenticated
      @user = user
      session[:user_id] = @user.id
      redirect_to :root
    else
      redirect_to 'new'
    end

  end

  def destroy
  end
end

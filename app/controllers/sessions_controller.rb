class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    invalid = 'Invalid username or password.'
    user = User.find_by(name: user_params[:name])
    password = user_params[:password]
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      flash[:name] = invalid
      redirect_to login_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    return redirect_to(controller: 'users', action: 'new') unless params[:user][:password] == params[:user][:password_confirmation]
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to '/'
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end

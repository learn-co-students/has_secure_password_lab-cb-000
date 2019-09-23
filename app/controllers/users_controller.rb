class UsersController < ApplicationController
  def new
    @user = User.new
    render 'signup'
  end

  def create
    @user = User.new(user_params)
    # if params[:user][:password] == params[:user][:password_confirmation]
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/homepage'
      else
        flash[:notice] = "User input invalid"
        redirect_to '/signup'
      end
    # else
    #   flash[:notice] = "Passwords don't match"
    #   redirect_to '/signup'
    # end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

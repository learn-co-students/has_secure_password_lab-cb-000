class UsersController < ApplicationController


  def show

@user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  #  binding.pry
    if params[:user][:password] == params[:user][:password_confirmation]
    @user = User.create(user_params)

    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
    else
      flash[:alert] = "Passwords do not match."
      redirect_to "/users/new"
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end

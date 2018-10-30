class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    if @user.save
      redirect_to 'root_path'
    else
      redirect_to 'users/new'
    end
  end

  private

  def user_params
    params.require[:user].permit[:username, :password, :password_confirmation]
  end

end

class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(:name => params[:user][:name], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to new_user_path
    end
  end

  def home
    render :home
  end



end

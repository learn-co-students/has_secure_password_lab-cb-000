class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = 'you have been logedd in succsfully'
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy

  end
end

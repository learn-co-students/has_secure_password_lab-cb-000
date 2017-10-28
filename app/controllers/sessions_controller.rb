class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.valid? && user = User.find_by(user_params[:name])

      if user.authenticate(user_params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render :new, :flash => {:errors => "Wrong name or password"}
      end

    else
      render :new, :flash => {:errors => @user.errors.full_messages}
    end

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end

class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params(:name, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'sessions', action: "new"
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

end

class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params(:name, :password, :password_confirmation))
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'sessions', action: "new"
  end

end

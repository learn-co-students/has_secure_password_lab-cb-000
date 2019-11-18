class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(params.require(:user).permit(:name, :password, :password_confirmation))
    if user.save
      session[:user_id] = user.id
      return redirect_to controller: 'welcome', action: 'home'
    else
      return redirect_to new_user_path
    end
  end
end

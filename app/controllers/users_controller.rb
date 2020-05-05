class UsersController < ApplicationController 
  
  def new 
    @user = User.new
  end 
  
  def create
   @user = User.new(user_params)
   if @user.valid?
     @user.save
     session[:user_id] = @user.id
redirect_to homepage_path

 else
      redirect_to new_users_path
  end
end 
 
 def homepage
    @user = User.find_by(id: session[:user_id])
  end


 
  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
end 
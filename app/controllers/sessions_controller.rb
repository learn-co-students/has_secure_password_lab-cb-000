class SessionsController < ApplicationController


  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
    else
        return head(:forbidden)
  end

end






private

  def user_params
      params.require(:user).permit(:name, :password)
  end


end

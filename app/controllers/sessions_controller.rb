class SessionsController < ApplicationController



  def create
    print params
   @user = User.find_by(name: params[:user][:name])
   return redirect_to '/sessions/new' unless @user.authenticate(params[:user][:password])
   session[:user_id] = @user.id
   redirect_to '/welcome/index'




 end

end

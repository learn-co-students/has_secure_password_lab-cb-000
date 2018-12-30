class SessionsController < ApplicationController
  def create
    #byebug
    if params[:user][:password] && !params[:user][:name].empty? &&
      !User.find_by(name:params[:user][:name]).nil?
      @user = User.find_by(name:params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
      else
        session[:user_id] = nil
      end
    else
      session[:user_id] = nil
    end
  end
end

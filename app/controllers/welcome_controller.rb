class WelcomeController < ApplicationController
  #before_action :require_logged_in

  def home
    @user = User.find_by(params[:user_id])
    if @user.nil?
      redirect_to new_user_path
    else


    end
  end
end

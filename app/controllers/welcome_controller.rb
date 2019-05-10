class WelcomeController < ApplicationController
  def home
    redirect_to root_path unless current_user
    @user = User.find_by(id: current_user)
  end

  def index
    redirect_to home_path if current_user
  end
end

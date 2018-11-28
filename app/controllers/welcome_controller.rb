class WelcomeController < ApplicationController
  before_action :require_login

  def index
    @user = User.find_by(id: session[:user_id])
  end

  private
    def require_login
      if !session[:user_id]
        redirect_to login_path
      end
    end
end
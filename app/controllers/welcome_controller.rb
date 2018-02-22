class WelcomeController < ApplicationController
  def index
  end

  def show
    redirect_to '/login' unless logged_in?
  end
end

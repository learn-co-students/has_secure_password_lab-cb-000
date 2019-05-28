class WelcomeController < ApplicationController
  def homepage
    return head(:forbidden) unless session[:user_id]
  end
end

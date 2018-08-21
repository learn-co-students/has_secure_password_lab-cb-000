class WelcomeController < ApplicationController
  before_action :verify_user
  def home
  end

  def verify_user
    return head(:forbidden) unless current_user
  end
end

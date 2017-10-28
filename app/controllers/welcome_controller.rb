class WelcomeController < ApplicationController

  before_action :require_login, :only => :welcome

  def welcome
    render :welcome
  end


end

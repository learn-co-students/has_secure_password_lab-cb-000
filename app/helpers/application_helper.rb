module ApplicationHelper

  def current_user
    User.find(session[:user_id]) unless !session.include?(:name) || session[:name] == nil
  end
end

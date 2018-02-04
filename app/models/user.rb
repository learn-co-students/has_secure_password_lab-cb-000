class User < ActiveRecord::Base
  has_secure_password

  def current_user
    User.find_by_id(session[:user_id])
  end
end

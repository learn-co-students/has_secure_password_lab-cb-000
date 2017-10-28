class User < ActiveRecord::Base
  #validations
  validates_confirmation_of :password

  #bcrypt password 
  has_secure_password
end

class User < ActiveRecord::Base
  has_secure_password
  # validates :password, presence: true
  # validate :confirm_password

  # def confirm_password
  #   if !self.password_confirmation.nil? && self.password != self.password_confirmation
  #     errors.add(:password, "Passwords do not match")
  #   end
  # end
  #
  # def authenticate(password)
  #   if self.password == password
  #     self
  #   end
  # end
end

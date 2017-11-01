class User < ActiveRecord::Base
validate :passwords_the_same

  def authenticate(password)
    if self.password == password
      self
    else
      false
    end
  end


private

  def passwords_the_same
    if self.password == nil
      self.errors[:password] = "can't be nil"
    elsif self.password_confirmation == nil
    elsif !(self.password == self.password_confirmation)
      self.errors[:password] = "must match password confirmation"
    end
  end
end

require 'bcrypt'

class Auth
  def initialize
    @salt = 'Super awesome salt'
    @cost = 13
  end

  attr_accessor :salt, :cost

  def hash_password(password)
    if password.empty?
      return nil
    end

    return BCrypt::Password.create(password, cost: self.cost.to_i)
  end

  def valid_password(password)
    if password.empty?
      return nil
    end

    hash_password(password) == password
  end
end
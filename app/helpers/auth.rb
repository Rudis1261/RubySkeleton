require 'bcrypt'
require 'securerandom'

module AuthHelpers
  def create_salt
    SecureRandom.uuid()
  end

  def create_hash(password, salt = nil)
    salt = salt ||= self.create_salt

    BCrypt::Password.create(password + salt, cost: 13)
  end

  def restore_hash(stored_hash)
    BCrypt::Password.new stored_hash
  end

  def compare_hash(password, salt, stored_hash)
    self.restore_hash(stored_hash) == password + salt
  end
end
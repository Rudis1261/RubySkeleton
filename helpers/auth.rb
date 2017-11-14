require 'bcrypt'

module Sinatra
  module NAME
    module Helpers
      class AuthHelper
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
          # TODO salt should be a randomly generated value at signup and password resets
          # TODO use http://www.rubydoc.info/stdlib/securerandom/1.9.3/SecureRandom
          if password.empty?
            return nil
          end

          hash_password(password) == password
        end
      end
    end
  end
end
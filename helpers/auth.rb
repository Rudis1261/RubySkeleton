require 'bcrypt'

module Sinatra
  module NAME
    module Helpers
      class AuthHelper
        def initialize
          @cost = 13
        end

        attr_accessor :cost
        # When a user updates, reset, creates their account we need to do 2 things:
        # Generate a salt using Secure-random
        # Generate a hash with the user's password + salt
        # Store both the salt and the resulting hash in the db

        #salt = SecureRandom.uuid()
        #hash = BCrypt::Password.create("awesomePassword" + salt, cost: 10)

        def hash_password(password)
          if password.empty?
            return nil
          end

          return BCrypt::Password.create(password, cost: self.cost.to_i)
          # Restoring stored string as a hash
          #restored_hash = BCrypt::Password.new
        end

        # This will be used to challenge the user's login attempt
        # No.1 Would be to try and match the user via either username or email
        # Then calculate the hash for comparison based on the user's provided password
        def login(email_or_username, password)
          user = User.where(:username => email_or_username).where(:email=> email_or_username).first
          if !user
            return nil
          end
        end

        # def valid_password(password)
        #   # TODO salt should be a randomly generated value at signup and password resets
        #   # TODO use http://www.rubydoc.info/stdlib/securerandom/1.9.3/SecureRandom
        #   if password.empty?
        #     return nil
        #   end
        #
        #   #hash_password(password) == password
        # end
      end
    end
  end
end
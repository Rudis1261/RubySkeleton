class User < ActiveRecord::Base
  # When creating a user we only need a few fields, the reset will be managed through the interface, or through the user journey
  # The Form should contain:
  # - username (R)
  # - email (R)
  # - password (R)
  # - password_confirmation

  # The schema:
  # - username
  # - email
  # - password
  # - nonce
  # - activated
  # - activation_code
  # - password_reset_token
  # - locked
  # - role

  validates :namename, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  #validates :password, confirmation: true
  #validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  # Sample usage
  # class MyInlineTEst
  #   include AuthHelpers
  #
  #   def initialize
  #     test_pass = 'hellooooSon'
  #     stored_pass = '$2a$13$Pi7NYpIbx4oT.ckeNrlG0uK5NKcFYAIZS07fHXlbUpoiiu3ikJyBu'
  #     salt = 'f5a50941-d1b0-4cd5-8a64-0af9ce524c5d'
  #     hash = create_hash(test_pass, salt)
  #     salt2 = create_salt
  #     hash2 = create_hash(test_pass)
  #
  #     puts salt, hash, salt2, hash2
  #     puts compare_hash(test_pass, salt, stored_pass)
  #     puts compare_hash(test_pass, salt2, stored_pass)
  #   end
  # end
  # MyInlineTEst.new

end
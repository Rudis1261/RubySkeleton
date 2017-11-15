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
end
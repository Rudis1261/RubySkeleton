class User < ActiveRecord::Base
  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  validates :username, uniqueness: true
end
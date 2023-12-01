class User < ApplicationRecord
  has_secure_password

  # Remove the line with 'name' attribute
  # validates :name, presence: true

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end

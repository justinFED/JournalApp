class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  has_many :tasks, dependent: :destroy
  has_many :categories, dependent: :destroy
end

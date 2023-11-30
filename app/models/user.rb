class User < ApplicationRecord
    validates :username, :password, presence: true
  
    def self.login(username, password)
      user = find_by(username: username, password: password)
      user.id if user
    end
  end
  
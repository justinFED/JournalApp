class Category < ApplicationRecord
    validates :name, presence: true
  
    has_many :tasks, dependent: :destroy
    belongs_to :user
  end
  
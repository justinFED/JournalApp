class Task < ApplicationRecord
    belongs_to :category
  
    validates :name, presence: true
  
    def details_for_view
      "#{name} (Category: #{category.name})"
    end
  
    def self.view_tasks_for_today
      today = Date.today
      where('created_at >= ? AND created_at < ?', today.beginning_of_day, today.end_of_day)
        .map { |task| task.details_for_view }
    end
  end
  
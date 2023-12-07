class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true

  def details_for_view
    task_name = name.present? ? name : 'Unnamed Task'
    category_name = category&.name.present? ? category.name : 'Uncategorized'
    "#{task_name} (Category: #{category_name})"
  end

  def self.view_tasks_for_today(user)
    today = Date.today
    where(user: user)
      .where('created_at >= ? AND created_at < ?', today.beginning_of_day, today.end_of_day)
      .map(&:details_for_view)
  end
end

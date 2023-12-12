class AddUserIdToTasks < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:tasks, :user_id)
      add_reference :tasks, :user, null: false, foreign_key: true, type: :integer
    end
  end
end

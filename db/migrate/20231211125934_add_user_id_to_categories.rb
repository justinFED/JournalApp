# db/migrate/xxxxxx_add_user_id_to_categories.rb
class AddUserIdToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :user, foreign_key: true
  end
end

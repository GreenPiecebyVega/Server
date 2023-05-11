class RemoveRemeberMeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :remember_created_at, :datetime
  end
end

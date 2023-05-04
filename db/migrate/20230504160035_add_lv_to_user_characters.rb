class AddLvToUserCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :user_characters, :lv, :integer, default: 1, after: :slug
  end
end

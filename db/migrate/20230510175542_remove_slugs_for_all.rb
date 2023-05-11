class RemoveSlugsForAll < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :slug, :string
    remove_column :base_characters, :slug, :string
    remove_column :characters, :slug, :string
    remove_column :user_characters, :slug, :string
  end
end

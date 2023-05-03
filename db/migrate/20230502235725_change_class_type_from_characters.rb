class ChangeClassTypeFromCharacters < ActiveRecord::Migration[7.0]
  def up
    change_column :characters, :class, :integer, after: :slug
  end
  def down
    change_column :characters, :class, :string, after: :slug
  end
end

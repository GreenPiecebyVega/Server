class ChangeClassTypeFromBaseCharacters < ActiveRecord::Migration[7.0]
  def up
    change_column :base_characters, :class, :integer, after: :slug
  end
  def down
    change_column :base_characters, :class, :string, after: :slug
  end
end

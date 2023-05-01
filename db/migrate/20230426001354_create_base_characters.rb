class CreateBaseCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :base_characters do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :class, null: false
      t.timestamps null: false
    end
  end
end

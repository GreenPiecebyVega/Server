class CreateUserCharacterBans < ActiveRecord::Migration[7.0]
  def change
    create_table :user_character_bans do |t|
      t.references :user_character, null: false, foreign_key: true

      t.integer :category
      t.datetime :expiry_date
      t.text :description

      t.timestamps null: false
    end
  end
end

# frozen_string_literal: true

class CreateUserCharactersInventory < ActiveRecord::Migration[7.0]
  def change
    create_table :user_characters_inventory do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :user_character, null: false, foreign_key: true, index: true

      t.decimal :gp_coin

      t.timestamps null: false
    end
  end
end

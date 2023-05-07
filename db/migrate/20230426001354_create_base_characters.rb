# frozen_string_literal: true

class CreateBaseCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :base_characters do |t|
      t.references :user, null: false, foreign_key: true, index: true

      t.string :name, null: false
      t.string :slug, null: false
      t.integer :gp_character_base, null: false

      t.boolean :is_active, default: true
      t.timestamps null: false
    end
  end
end

# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      
      t.references :base_character, null: false, foreign_key: true, index: true
      
      t.string :name, null: false
      t.string :name_abreviation, null: false
      
      t.string :slug, null: false
      t.integer :gp_character, null: false
      
      t.boolean :is_active, default: true
      t.timestamps null: false
    end
  end
end

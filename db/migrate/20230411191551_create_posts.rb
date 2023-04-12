# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, index: true
      t.string :slug, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.timestamp :published_at
      t.timestamps null: false
    end
    add_index :posts, :slug, unique: true
  end
end

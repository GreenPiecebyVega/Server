class CreateGameModes < ActiveRecord::Migration[7.0]
  def change
    create_table :game_modes do |t|
      t.string :name
      t.integer :category
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end

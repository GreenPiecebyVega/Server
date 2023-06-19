class CreateUsersGameModes < ActiveRecord::Migration[7.0]
  def change
    create_table :users_game_modes do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :game_mode, null: false, foreign_key: true, index: true

      t.boolean :is_being_played, default: false

      t.timestamps null: false
    end
  end
end

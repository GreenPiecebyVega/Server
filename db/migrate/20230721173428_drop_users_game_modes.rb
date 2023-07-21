class DropUsersGameModes < ActiveRecord::Migration[7.0]
  def change
    drop_table :users_game_modes
  end
end

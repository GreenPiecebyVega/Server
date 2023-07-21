class RemoveUserGameModeFromUserCharacters < ActiveRecord::Migration[7.0]
  def change
    remove_reference :user_characters, :user_game_mode, index: true, foreign_key: true
  end
end

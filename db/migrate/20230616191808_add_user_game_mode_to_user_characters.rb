class AddUserGameModeToUserCharacters < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_characters, :user_game_mode, index: true, foreign_key: true, after: :id
  end
end

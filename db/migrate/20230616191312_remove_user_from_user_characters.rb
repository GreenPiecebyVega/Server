class RemoveUserFromUserCharacters < ActiveRecord::Migration[7.0]
  def change
    remove_reference :user_characters, :user
  end
end

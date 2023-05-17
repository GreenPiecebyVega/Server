class RemoveUserFromUserCharactersInventory < ActiveRecord::Migration[7.0]
  def change
    remove_reference :user_characters_inventory, :user, index: true, foreign_key: true
  end
end

class RemoveUserFromBaseCharactersAndCharacters < ActiveRecord::Migration[7.0]
  def change
    remove_reference :base_characters, :user, index: true, foreign_key: true
    remove_reference :characters, :user, index: true, foreign_key: true
  end
end

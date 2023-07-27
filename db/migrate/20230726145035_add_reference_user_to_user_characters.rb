class AddReferenceUserToUserCharacters < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_characters, :user, null: false, foreign_key: true, index: true, after: :id
  end
end

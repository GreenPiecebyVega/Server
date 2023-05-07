class UserCharacterInventory < ApplicationRecord
  belongs_to :user
  belongs_to :user_character
end

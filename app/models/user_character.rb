# frozen_string_literal: true
class UserCharacter < ApplicationRecord
  # Associations #
  belongs_to :user
  belongs_to :character

  has_one :inventory, class_name: 'UserCharacterInventory', foreign_key: :user_character_inventory_id,
                      dependent: :destroy
end

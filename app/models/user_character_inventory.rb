# frozen_string_literal: true

class UserCharacterInventory < ApplicationRecord
  belongs_to :user_character
end

# frozen_string_literal: true

class UserCharacterBan < ApplicationRecord
  belongs_to :user_character

  enum category: %i[temporary permanent]

  validates :description, presence: true
  validates :expiry_date, presence: true, if: :temporary?
end

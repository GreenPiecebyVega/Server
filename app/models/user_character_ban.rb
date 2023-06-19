class UserCharacterBan < ApplicationRecord
  belongs_to :user_character

  enum category: [:temporary, :permanent]

  validates :description, presence: true
  validates :expiry_date, presence: true, if: :temporary?
end
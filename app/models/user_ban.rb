class UserBan < ApplicationRecord
  belongs_to :user

  enum category: [:temporary, :permanent]
  
  validates :description, presence: true
  validates :expiry_date, presence: true, if: :temporary?
end

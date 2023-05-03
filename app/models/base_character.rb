class BaseCharacter < ApplicationRecord
  has_many :characters
  
  extend FriendlyId
  friendly_id :nome, use: [:slugged]

  enum gp_character_base: %i[fisica magica]
end

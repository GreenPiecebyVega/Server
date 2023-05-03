class BaseCharacter < ApplicationRecord
  has_many :characters
  
  enum class: %i[guerreiro mago combatente]
end

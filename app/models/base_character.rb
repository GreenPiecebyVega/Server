class BaseCharacter < ApplicationRecord
  has_many :characters
  
  enum class: %i[fisica magica]
end

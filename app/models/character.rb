class Character < ApplicationRecord
  belongs_to :user
  belongs_to :base_characters
  
  enum class: %i[guerreiro guardiao mago xanter duelista arqueiro]

  def self.class_abrv
    case self.class
    when 0
      'WA'
    when 1
      'GG'
    when 2
      'WI'
    when 3
      'XT'
    when 4
      'SW'
    else
      'AR'
    end
  end
end

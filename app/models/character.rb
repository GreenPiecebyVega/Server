class Character < ApplicationRecord
  belongs_to :base_character
  
  extend FriendlyId
  friendly_id :nome, use: [:slugged]
  
  enum gp_character: %i[guerreiro guardiao mago xanter duelista arqueiro]

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

# frozen_string_literal: true

class Character < ApplicationRecord
  belongs_to :base_character

  has_many :user_characters, class_name: 'UserCharacter', dependent: :delete_all

  enum gp_character: %i[guerreiro guardiao mago xanter duelista arqueiro]

  scope :guerreiro, -> { where(gp_character: 1) }
  scope :guardiao,  -> { where(gp_character: 2) }
  scope :mago,      -> { where(gp_character: 3) }
  scope :xanter,    -> { where(gp_character: 4) }
  scope :duelista,  -> { where(gp_character: 5) }
  scope :arqueiro,  -> { where(gp_character: 6) }

  def nature
    base_character.gp_character_base
  end
end

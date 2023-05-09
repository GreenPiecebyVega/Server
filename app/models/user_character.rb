# frozen_string_literal: true

class UserCharacter < ApplicationRecord
  include UserCharacters::Validations
  include UserCharacters::UpgradeOrDowngradeHabilityPower

  belongs_to :user
  belongs_to :character

  has_one :inventory, class_name: 'UserCharacterInventory', foreign_key: :user_character_inventory_id,
                      dependent: :destroy

  before_create :set_user_character_defaults

  before_save :set_hability_points, if: :leveled_up?
  before_save :upgrade_or_downgrade_hability_power

  def leveled_up?
    false
  end

  private

  def set_hability_points
    false
  end

  def gp_character_base
    character.base_character.gp_character_base
  end

  def set_user_character_defaults
    case gp_character_base
    when 'fisica'
      hp       = 0
      mp       = 0
      ataque   = (strength_properties[:ataque] * 3)
      defesa   = (strength_properties[:defesa] * 3)
      precisao = (strength_properties[:precisao] * 3)
      evasao   = (strength_properties[:evasao] * 3)
    else
      hp            = 0
      mp            = 0
      ataque_magico = (devotion_properties[:ataque_magico] * 3)
      defesa        = (devotion_properties[:defesa] * 3)
      precisao      = (devotion_properties[:precisao] * 3)
      evasao        = (devotion_properties[:evasao] * 3)
    end
    taxa_critica = BigDecimal('05.00')
    dano_critico = BigDecimal('20.00')
  end
end

# frozen_string_literal: true

class UserCharacter < ApplicationRecord
  include UserCharacters::Validations
  include UserCharacters::UpgradeOrDowngradeHabilityPower

  belongs_to :user
  belongs_to :character
  has_one :inventory, class_name: 'UserCharacterInventory', dependent: :destroy

  before_commit :set_user_character_defaults, if: -> { self.new_record? }
  # ref: upgrade_or_downgrade_hability_power.rb
  before_save :upgrade_or_downgrade_hability_power, if: :has_hability_points_changes?
  before_destroy :can_destroy?, prepend: true

  private

  # [fisica magica]
  def base_class
    character.base_character.gp_character_base
  end

  # [guerreiro guardiao mago xanter duelista arqueiro]
  def character_class
    character.gp_character
  end

  def set_user_character_defaults
    # set's lv 1 points of hability power
    case base_class
    when 'fisica'
      upgrade_or_downgrade_strength(3, :upgrade)
    else 'magica'
      upgrade_or_downgrade_devotion(3, :upgrade)
    end
    self.hability_points = 0
    # set's attr's defaults
    self.taxa_critica = BigDecimal('5.00')
    self.dano_critico = BigDecimal('20.00')

    self.build_inventory && self.inventory.save
  end

  def can_destroy?
    if self.lv >= 100
      errors.add(:lv, I18n.t('activerecord.errors.models.user_character.messages.cant_destroy'))
      throw :abort
    end
  end
  
  %i[hp mp ataque defesa ataque_magico adicional_damage real_damage amplificação_de_dano_fisico
    amplificação_de_dano_magico evasao precisao esquiva amplificação_de_tx taxa_critica dano_critico
    roubo_de_hp roubo_de_mp resistencia_a_taxa_critica resistencia_ao_dano_critico resistencia_a_queda
    resistencia_ao_atordoamento experience group_experience pet_experience ruby_experience war_experience
    guild_war_experience].each do |method|
    define_method "#{method}=" do |value|
      write_attribute method, (value.to_s.match(/,/) ? value.gsub('.', '').gsub(',', '.') : value)
    end
  end
end

# frozen_string_literal: true

class UserCharacter < ApplicationRecord
  include UserCharacters::Validations
  include UserCharacters::UpgradeOrDowngradeHabilityPower

  belongs_to :character

  has_one :inventory, class_name: 'UserCharacterInventory', dependent: :destroy

  has_many :bans, class_name: 'UserCharacterBan', dependent: :delete_all

  before_validation :set_user_character_defaults, on: :create
  before_validation :upgrade_or_downgrade_hability_power, if: :has_hability_points_changes?

  before_destroy :can_destroy?, prepend: true

  private

  # [fisica magica]
  def base_class
    character.base_character.gp_character_base if character.present?
  end

  # [guerreiro guardiao mago xanter duelista arqueiro]
  def character_class
    character.gp_character
  end

  def can_destroy?
    return false unless lv >= 100

    errors.add(:lv, I18n.t('activerecord.errors.models.user_character.messages.cant_destroy'))
    throw :abort
  end

  def set_user_character_defaults
    ##########
    # MMORPG #
    ##########
    # if user_game_mode.game_mode.category == 'mmorpg'
    #   # Lv 1 hability #
    #   case base_class
    #   when 'fisica'
    #     upgrade_or_downgrade_strength(3, :upgrade)
    #   else 'magica'
    #     upgrade_or_downgrade_devotion(3, :upgrade)
    #   end
    #   self.hability_points = 0
    # ########
    # # MOBA #
    # ########
    # else
    #   # Hability && Game Mode #
    #   self.hability_points = 570
    # end
    # Inventory #
    build_inventory
  end
end

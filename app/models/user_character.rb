# frozen_string_literal: true

class UserCharacter < ApplicationRecord
  include UserCharacters::Validations
  include UserCharacters::UpgradeOrDowngradeHabilityPower

  belongs_to :user
  belongs_to :character

  has_one :inventory, class_name: 'UserCharacterInventory', dependent: :destroy

  has_many :bans, class_name: 'UserCharacterBan', dependent: :delete_all

  before_create :set_user_character_defaults
  before_validation :upgrade_or_downgrade_hability_power, if: :has_hability_points_changes?

  before_destroy :can_destroy?, prepend: true

  validates :nickname, presence: true

  private

  def can_destroy?
    return false unless lv >= 100

    errors.add(:lv, I18n.t('activerecord.errors.models.user_character.messages.cant_destroy'))
    throw :abort
  end

  def set_user_character_defaults
    character = Character.find(character_id)
    case character.nature
    when 'physical'
      upgrade_or_downgrade_strength(3, :upgrade)
    when 'magic'
      upgrade_or_downgrade_devotion(3, :upgrade)
    end

    case character.gp_character
    when 'guerreiro'
      upgrade_or_downgrade_strength(3, :upgrade)
    when 'guardiao'
      upgrade_or_downgrade_tenacity(3, :upgrade)
    when 'mago'
      upgrade_or_downgrade_devotion(3, :upgrade)
    when 'xanter'
      upgrade_or_downgrade_wisdom(3, :upgrade)
    when 'duelista'
      upgrade_or_downgrade_strength(3, :upgrade)
    when 'arqueiro'
      upgrade_or_downgrade_devotion(3, :upgrade)
    end

    self.hability_points = 0
    build_inventory
  end
end

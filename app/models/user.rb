# frozen_string_literal: true

#
# User Model
#
class User < ApplicationRecord
  # Devise
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # Callbacks
  before_create :set_slug

  # Enums
  enum perfil: %i[player temp gm master]

  %i[qtd_gp_coin qtd_gp_cash bonus_xp bonus_rxp bonus_drop bonus_wxp bonus_gwxp bonus_ep bonus_crftxp
     bonus_petxp].each do |method|
    define_method "#{method}=" do |value|
      write_attribute method, (value.to_s.match(/,/) ? value.gsub('.', '').gsub(',', '.') : value)
    end
  end

  # Headers
  def self.master?
    perfil == 3
  end

  # Game Master
  def self.gm?
    perfil == 2
  end

  # Conta Temporária
  def self.tmp?
    perfil == 1 && data_expiracao.present?
  end

  # Default
  def self.gp_player?
    perfil.zero?
  end

  def set_slug
    self.slug = "#{username}:#{DateTime.now}&#{rand(1..9_999_999)}"
  end
end

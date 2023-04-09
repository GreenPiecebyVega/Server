# frozen_string_literal: true

#
# User Model
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  # Enums
  enum perfil: %i[player temp gm adm master]

  %i[qtd_gp_coin qtd_gp_cash bonus_xp bonus_rxp bonus_drop bonus_wxp bonus_gwxp bonus_ep bonus_crftxp
     bonus_petxp].each do |method|
    define_method "#{method}=" do |value|
      write_attribute method, (value.to_s.match(/,/) ? value.gsub('.', '').gsub(',', '.') : value)
    end
  end

  # Regular Account
  def self.gp_player?
    perfil == 1
  end

  def self.master?
    perfil == 4
  end

  def self.adm?
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
end

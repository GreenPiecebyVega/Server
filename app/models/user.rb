# frozen_string_literal: true

class User < ApplicationRecord
  # Writers
  attr_writer :login

  # Concerns
  include Users::Allowlist
  include Users::Associations
  include Users::Logic
  include Users::Validations

  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :trackable,
         :rememberable,
         :validatable,
         :timeoutable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  extend FriendlyId
  friendly_id :username, use: [:slugged]

  # Enums
  enum perfil: %i[player temporaria gm master]

  # Devise override for logging in with username or email
  def login
    @login || username || email
  end

  # Head
  def self.master?
    perfil == 3
  end

  # Game Master
  def self.gm?
    perfil == 2
  end

  # Conta Temporária
  def self.temporaria?
    perfil == 1 && data_expiracao.present?
  end

  # Default
  def self.gp_player?
    perfil.zero?
  end

  def full_name
    "#{nome} #{sobrenome}".capitalize
  end

  # Use :login for searching username and email
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where([
                              'lower(username) = :value OR lower(email) = :value',
                              { value: login.strip.downcase }
                            ]).first
  end

  # Make sure to send the devise emails via async
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  %i[qtd_gp_coin qtd_gp_cash bonus_xp bonus_rxp bonus_drop bonus_wxp bonus_gwxp bonus_ep bonus_crftxp
     bonus_petxp].each do |method|
    define_method "#{method}=" do |value|
      write_attribute method, (value.to_s.match(/,/) ? value.gsub('.', '').gsub(',', '.') : value)
    end
  end
end

# frozen_string_literal: true
class User < ApplicationRecord
  # Writers
  attr_writer :login

  # Concerns
  include Users::Associations
  include Users::Logic
  include Users::Validations
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :trackable,
         :rememberable,
         :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  extend FriendlyId
  friendly_id :username, use: [:slugged]

  # Enums
  enum role: %i[player temporaria gm master]
  enum account_type: %i[free premium]

  scope :gp_staf, -> { where('role = ? OR role = ?', 2, 3) }
  scope :clientes, -> { where('perfl = ?', 0) }

  # Devise override for logging in with username or email
  def login
    @login || username || email
  end

  def self.staf_member?
    master? || gm?
  end

  def self.client?
    player? || temporaria?
  end

  # Head
  def self.master?
    role == 3
  end

  # Game Master
  def self.gm?
    role == 2
  end

  # Conta Temporária
  def self.temporaria?
    role == 1 && data_expiracao.present?
  end

  # Default
  def self.player?
    role.zero?
  end

  def full_name
    "#{name} #{lastname}".capitalize
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
    UserMailer.send(notification, self, *args).deliver_later
  end

  %i[qtd_gp_coin qtd_gp_cash bonus_experience bonus_ruby_experience bonus_drop bonus_war_experience bonus_guild_war_experience bonus_energy_recovery bonus_craft_experience
     bonus_pet_experience].each do |method|
    define_method "#{method}=" do |value|
      write_attribute method, (value.to_s.match(/,/) ? value.gsub('.', '').gsub(',', '.') : value)
    end
  end
end

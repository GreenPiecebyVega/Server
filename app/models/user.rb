# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bonus_craft_experience           :decimal(3, 2)    default(0.0)
#  bonus_drop             :decimal(3, 2)    default(0.0)
#  bonus_energy_recovery               :decimal(3, 2)    default(0.0)
#  bonus_guild_war_experience             :decimal(3, 2)    default(0.0)
#  bonus_pet_experience            :decimal(3, 2)    default(0.0)
#  bonus_ruby_experience              :decimal(3, 2)    default(0.0)
#  bonus_war_experience              :decimal(3, 2)    default(0.0)
#  bonus_experience               :decimal(3, 2)    default(0.0)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  data_expiracao         :date
#  data_nascimento        :date             not null
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  is_active             :boolean          default(FALSE)
#  is_online            :boolean          default(FALSE)
#  failed_attempts        :integer          default(0), not null
#  jti                    :string(255)      not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  locked_at              :datetime
#  name                   :string(255)      not null
#  role                 :integer          default("player")
#  qtd_gp_cash            :decimal(4, 2)    default(0.0)
#  qtd_gp_coin            :decimal(10, 2)   default(0.0)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sexo                   :integer          default(0)
#  sexo_outro             :string(255)
#  sign_in_count          :integer          default(0), not null
#  slug                   :string(255)      not null
#  lastname              :string(255)      not null
#  telefone               :string(255)      not null
#  unconfirmed_email      :string(255)
#  unlock_token           :string(255)
#  username               :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
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

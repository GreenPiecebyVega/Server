# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  slug                   :string(255)      not null
#  username               :string(255)      not null
#  nome                   :string(255)      not null
#  sobrenome              :string(255)      not null
#  telefone               :string(255)      not null
#  data_nascimento        :date             not null
#  sexo                   :integer          default(0)
#  sexo_outro             :string(255)
#  qtd_gp_coin            :decimal(10, 2)   default(0.0)
#  qtd_gp_cash            :decimal(4, 2)    default(0.0)
#  bonus_xp               :decimal(3, 2)    default(0.0)
#  bonus_rxp              :decimal(3, 2)    default(0.0)
#  bonus_drop             :decimal(3, 2)    default(0.0)
#  bonus_wxp              :decimal(3, 2)    default(0.0)
#  bonus_gwxp             :decimal(3, 2)    default(0.0)
#  bonus_crftxp           :decimal(3, 2)    default(0.0)
#  bonus_petxp            :decimal(3, 2)    default(0.0)
#  bonus_ep               :decimal(3, 2)    default(0.0)
#  esta_online            :boolean          default(FALSE)
#  esta_ativo             :boolean          default(FALSE)
#  data_expiracao         :date
#  perfil                 :integer          default("player")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
#
# User Model as account
#
class User < ApplicationRecord
  # Concerns
  include Users::Allowlist
  include Users::Associations
  include Users::Logic
  include Users::Validations

  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  extend FriendlyId
  friendly_id :username, use: [:slugged]

  # Devise override for logging in with username or email
  attr_writer :login

  def login
    @login || username || email
  end  

  # Enums
  enum perfil: %i[player temp gm master]

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

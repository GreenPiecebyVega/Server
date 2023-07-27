# frozen_string_literal: true

# After user creation two types of game mode is created, they called *moba* and *mmorpg*.
class User < ApplicationRecord
  attr_writer :login

  has_many :characters, class_name: 'UserCharacter', dependent: :destroy
  has_many :bans, class_name: 'UserBan', dependent: :destroy

  include Users::Validations

  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :lockable,
         :database_authenticatable,
         :jwt_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :trackable,
         :validatable, jwt_revocation_strategy: self

  # Enums
  enum role: %i[player temporary gm master]
  enum account_type: %i[free premium]

  scope :gp_staf, -> { where('role = ? OR role = ?', 2, 3) }
  scope :clientes, -> { where('role = ?', 0) }

  def login
    @login || username || email
  end

  def staf_member?
    master? || gm?
  end

  def client?
    player? || temporary?
  end

  def temporary?
    role == 1 && data_expiracao.present?
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

  def send_devise_notification(notification, *args)
    UserMailer.send(notification, self, *args).deliver_later
  end
end

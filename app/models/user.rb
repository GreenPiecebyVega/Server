# frozen_string_literal: true

class User < ApplicationRecord
  # write
  attr_writer :login
  
  # Identifies and manages a user on a Game Mode(Moba or MMORPG)
  has_and_belongs_to_many :game_modes, join_table: 'users_game_modes'
  
  has_many :bans, class_name: 'UserBan', dependent: :destroy

  # Concerns
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

  after_create :create_users_game_modes

  # Devise override for logging in with username or email
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

  # Make sure to send the devise emails via async
  def send_devise_notification(notification, *args)
    UserMailer.send(notification, self, *args).deliver_later
  end

  private

  # Auto generates user_game_mode record for each existent game_modes object
  def create_users_game_modes
    game_modes = GameMode.all
    game_modes.each do |obj|
      self.game_modes << obj
      self.save
    end
  end
end

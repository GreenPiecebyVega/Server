# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ############################
      # Database Authenticatable #
      ############################
      t.string :email,              null: false
      t.string :encrypted_password, null: false
      t.string :jti,                null: false
      t.string :slug,               null: false
      t.integer :account_type,      default: 1

      ##################
      # Personal Attrs #
      ##################
      t.string :username,      null: false
      t.string :name,          null: false
      t.string :lastname,      null: false
      t.string :telefone,      null: false
      t.date :data_nascimento, null: false
      t.integer :sexo,         default: 0
      t.string :sexo_outro,    default: nil

      #####################
      #      GP Cash      #
      #####################
      t.decimal :gp_cash, default: 0, precision: 4, scale: 2

      # BONUS DE EXPERIÊNCIA'S DA CONTA #
      t.decimal :bonus_experience, default: 0, precision: 3, scale: 2
      t.decimal :bonus_ruby_experience, default: 0, precision: 3, scale: 2
      t.decimal :bonus_drop, default: 0, precision: 3, scale: 2
      t.decimal :bonus_war_experience, default: 0, precision: 3, scale: 2
      t.decimal :bonus_guild_war_experience, default: 0, precision: 3, scale: 2
      t.decimal :bonus_craft_experience, default: 0, precision: 3, scale: 2
      t.decimal :bonus_pet_experience, default: 0, precision: 3, scale: 2
      t.decimal :bonus_energy_recovery, default: 0, precision: 3, scale: 2

      # Controladores #
      t.boolean :is_online, default: false
      t.integer :is_online_from, default: nil

      t.integer :role, default: 0
      t.date :data_expiracao, default: nil

      # Recoverable #
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      # Rememberable #
      t.datetime :remember_created_at
      # Trackable #
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.string :current_sign_in_ip
      t.datetime :last_sign_in_at
      t.string :last_sign_in_ip
      # Confirmable #
      t.string :unconfirmed_email
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # Lockable #
      t.integer  :failed_attempts, default: 0, null: false
      t.string   :unlock_token
      t.datetime :locked_at

      t.boolean :is_active, default: true
      t.timestamps null: false
    end

    # INDEX'S #
    add_index :users, :email,                unique: true
    add_index :users, :jti,                  unique: true
    add_index :users, :slug,                 unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end

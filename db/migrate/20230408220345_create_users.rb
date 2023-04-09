# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false
      t.string :username,           null: false
      t.string :encrypted_password, null: false
      t.string :slug,               null: false
      t.string :jti,                null: false
      

      ## Attrs
      t.string :nome,          null: false
      t.string :sobrenome,     null: false
      t.string :telefone,      null: false
      t.date :data_nascimento, null: false
      t.integer :sexo, default: 0
      t.string :sexo_outro

      ## GP Coin & GP Cash
      t.decimal :qtd_gp_coin, default: 0, precision: 10, scale: 2
      t.decimal :qtd_gp_cash, default: 0, precision: 4, scale: 2

      ## Técnicas
      # Bonus de Experiência
      t.decimal :bonus_xp, default: 0, precision: 3, scale: 2
      # Bonus de Experiência de Técnica
      t.decimal :bonus_rxp, default: 0, precision: 3, scale: 2

      # Bonus QTD DROP
      t.decimal :bonus_drop, default: 0, precision: 3, scale: 2
      # Bonus XP de Guerra
      t.decimal :bonus_wxp, default: 0, precision: 3, scale: 2
      # Bonus XP de Guerra entre Guilds(Clâs)
      t.decimal :bonus_gwxp, default: 0, precision: 3, scale: 2
      t.decimal :bonus_crftxp, default: 0, precision: 3, scale: 2
      t.decimal :bonus_petxp, default: 0, precision: 3, scale: 2

      ## Energia Points consumida em modo de Batalha BM1/BM2(Super Poder)
      t.decimal :bonus_ep, default: 0, precision: 3, scale: 2

      ## Controladores
      t.boolean :esta_online, default: false
      t.boolean :esta_ativo, default: false
      t.date :data_expiracao, default: nil

      ## Enums
      t.integer :perfil, default: 0

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false
      t.string   :unlock_token
      t.datetime :locked_at

      ## created_at, updated_at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
    add_index :users, :slug,                 unique: true
    add_index :users, :jti,                  unique: true
  end
end

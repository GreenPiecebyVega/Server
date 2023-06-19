# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_616_200_339) do
  create_table 'base_characters', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'gp_character_base', null: false
    t.boolean 'is_active', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'characters', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'base_character_id', null: false
    t.string 'name', null: false
    t.string 'name_abreviation', null: false
    t.integer 'gp_character', null: false
    t.boolean 'is_active', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['base_character_id'], name: 'index_characters_on_base_character_id'
  end

  create_table 'game_modes', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.integer 'category'
    t.boolean 'is_active'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'user_bans', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.integer 'category'
    t.datetime 'expiry_date'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_user_bans_on_user_id'
  end

  create_table 'user_character_bans', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'user_character_id', null: false
    t.integer 'category'
    t.datetime 'expiry_date'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_character_id'], name: 'index_user_character_bans_on_user_character_id'
  end

  create_table 'user_characters', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'user_game_mode_id'
    t.bigint 'character_id', null: false
    t.string 'nickname', null: false
    t.integer 'lv', default: 1
    t.integer 'energy_points', default: 0
    t.decimal 'experience', precision: 20, scale: 2, default: '0.0'
    t.decimal 'group_experience', precision: 20, scale: 2, default: '0.0'
    t.decimal 'pet_experience', precision: 20, scale: 2, default: '0.0'
    t.decimal 'ruby_experience', precision: 20, scale: 2, default: '0.0'
    t.decimal 'war_experience', precision: 20, scale: 2, default: '0.0'
    t.decimal 'guild_war_experience', precision: 20, scale: 2, default: '0.0'
    t.integer 'hability_points', default: 0
    t.integer 'strength', default: 0
    t.integer 'wisdom', default: 0
    t.integer 'devotion', default: 0
    t.integer 'tenacity', default: 0
    t.integer 'charisma', default: 0
    t.decimal 'hp', precision: 4, scale: 2, default: '0.0'
    t.decimal 'mp', precision: 4, scale: 2, default: '0.0'
    t.decimal 'ataque', precision: 4, scale: 2, default: '0.0'
    t.decimal 'ataque_magico', precision: 4, scale: 2, default: '0.0'
    t.decimal 'defesa', precision: 4, scale: 2, default: '0.0'
    t.decimal 'adicional_damage', precision: 3, scale: 2, default: '0.0'
    t.decimal 'real_damage', precision: 3, scale: 2, default: '0.0'
    t.decimal 'amplificação_de_dano_fisico', precision: 2, scale: 2, default: '0.0'
    t.decimal 'amplificação_de_dano_magico', precision: 2, scale: 2, default: '0.0'
    t.decimal 'evasao', precision: 2, scale: 2, default: '0.0'
    t.decimal 'precisao', precision: 2, scale: 2, default: '0.0'
    t.decimal 'esquiva', precision: 2, scale: 2, default: '0.0'
    t.decimal 'amplificação_de_tx', precision: 2, scale: 2, default: '0.0'
    t.decimal 'taxa_critica', precision: 2, scale: 2, default: '0.0'
    t.decimal 'dano_critico', precision: 3, scale: 2, default: '0.0'
    t.decimal 'roubo_de_hp', precision: 2, scale: 2, default: '0.0'
    t.decimal 'roubo_de_mp', precision: 2, scale: 2, default: '0.0'
    t.decimal 'resistencia_a_taxa_critica', precision: 2, scale: 2, default: '0.0'
    t.decimal 'resistencia_ao_dano_critico', precision: 2, scale: 2, default: '0.0'
    t.decimal 'resistencia_a_queda', precision: 2, scale: 2, default: '0.0'
    t.decimal 'resistencia_ao_atordoamento', precision: 2, scale: 2, default: '0.0'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['character_id'], name: 'index_user_characters_on_character_id'
    t.index ['user_game_mode_id'], name: 'index_user_characters_on_user_game_mode_id'
  end

  create_table 'user_characters_inventory', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'user_character_id', null: false
    t.decimal 'gp_coin', precision: 10
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_character_id'], name: 'index_user_characters_inventory_on_user_character_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'encrypted_password', null: false
    t.string 'jti', null: false
    t.integer 'account_type', default: 1
    t.string 'username', null: false
    t.string 'name', null: false
    t.string 'lastname', null: false
    t.string 'telefone', null: false
    t.date 'data_nascimento', null: false
    t.integer 'sexo', default: 0
    t.string 'sexo_outro'
    t.decimal 'gp_cash', precision: 4, scale: 2, default: '0.0'
    t.decimal 'bonus_experience', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_ruby_experience', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_drop', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_war_experience', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_guild_war_experience', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_craft_experience', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_pet_experience', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_energy_recovery', precision: 3, scale: 2, default: '0.0'
    t.boolean 'is_online', default: false
    t.integer 'is_online_from'
    t.integer 'role', default: 0
    t.date 'data_expiracao'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.string 'current_sign_in_ip'
    t.datetime 'last_sign_in_at'
    t.string 'last_sign_in_ip'
    t.string 'unconfirmed_email'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.boolean 'is_active', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['jti'], name: 'index_users_on_jti', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_users_on_unlock_token', unique: true
  end

  create_table 'users_game_modes', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'game_mode_id', null: false
    t.boolean 'is_being_played', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['game_mode_id'], name: 'index_users_game_modes_on_game_mode_id'
    t.index ['user_id'], name: 'index_users_game_modes_on_user_id'
  end

  add_foreign_key 'characters', 'base_characters'
  add_foreign_key 'user_character_bans', 'user_characters'
  add_foreign_key 'user_characters', 'characters'
  add_foreign_key 'user_characters', 'users_game_modes'
  add_foreign_key 'user_characters_inventory', 'user_characters'
  add_foreign_key 'users_game_modes', 'game_modes'
  add_foreign_key 'users_game_modes', 'users'
end

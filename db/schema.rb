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

ActiveRecord::Schema[7.0].define(version: 20_230_411_191_551) do
  create_table 'allowlisted_jwts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'jti', null: false
    t.string 'aud', null: false
    t.datetime 'exp', null: false
    t.string 'remote_ip'
    t.string 'os_data'
    t.string 'browser_data'
    t.string 'device_data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['jti'], name: 'index_allowlisted_jwts_on_jti', unique: true
    t.index ['user_id'], name: 'index_allowlisted_jwts_on_user_id'
  end

  create_table 'posts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'slug', null: false
    t.string 'title', null: false
    t.text 'content', null: false
    t.timestamp 'published_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['slug'], name: 'index_posts_on_slug', unique: true
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'encrypted_password', null: false
    t.string 'slug', null: false
    t.string 'username', null: false
    t.string 'nome', null: false
    t.string 'sobrenome', null: false
    t.string 'telefone', null: false
    t.date 'data_nascimento', null: false
    t.integer 'sexo', default: 0
    t.string 'sexo_outro'
    t.decimal 'qtd_gp_coin', precision: 10, scale: 2, default: '0.0'
    t.decimal 'qtd_gp_cash', precision: 4, scale: 2, default: '0.0'
    t.decimal 'bonus_xp', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_rxp', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_drop', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_wxp', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_gwxp', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_crftxp', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_petxp', precision: 3, scale: 2, default: '0.0'
    t.decimal 'bonus_ep', precision: 3, scale: 2, default: '0.0'
    t.boolean 'esta_online', default: false
    t.boolean 'esta_ativo', default: false
    t.date 'data_expiracao'
    t.integer 'perfil', default: 0
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['slug'], name: 'index_users_on_slug', unique: true
    t.index ['unlock_token'], name: 'index_users_on_unlock_token', unique: true
  end

  add_foreign_key 'allowlisted_jwts', 'users', on_delete: :cascade
end

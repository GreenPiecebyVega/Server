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

ActiveRecord::Schema[7.0].define(version: 2023_05_03_183304) do
  create_table "base_characters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome", null: false
    t.string "slug", null: false
    t.integer "gp_character_base", null: false
    t.integer "hp", default: 0
    t.integer "mp", default: 0
    t.integer "ataque", default: 0
    t.integer "ataque_magico", default: 0
    t.integer "defesa", default: 0
    t.decimal "amplificação_de_dano_fisico", precision: 2, scale: 2, default: "0.0"
    t.decimal "amplificação_de_dano_magico", precision: 2, scale: 2, default: "0.0"
    t.decimal "evasão", precision: 2, scale: 2, default: "0.0"
    t.decimal "preecisão", precision: 2, scale: 2, default: "0.0"
    t.decimal "esquiva", precision: 2, scale: 2, default: "0.0"
    t.decimal "amplificação_de_tx", precision: 2, scale: 2, default: "0.0"
    t.decimal "taxa_critica", precision: 2, scale: 2, default: "0.0"
    t.decimal "dano_critico", precision: 3, scale: 2, default: "0.0"
    t.decimal "roubo_de_hp", precision: 2, scale: 2, default: "0.0"
    t.decimal "roubo_de_mp", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_a_taxa_critica", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_ao_dano_critico", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_a_queda", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_ao_atordoamento", precision: 2, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "base_character_id", null: false
    t.string "nome", null: false
    t.string "slug", null: false
    t.integer "gp_character", null: false
    t.integer "hp", default: 0
    t.integer "mp", default: 0
    t.integer "ataque", default: 0
    t.integer "ataque_magico", default: 0
    t.integer "defesa", default: 0
    t.decimal "amplificação_de_dano_fisico", precision: 2, scale: 2, default: "0.0"
    t.decimal "amplificação_de_dano_magico", precision: 2, scale: 2, default: "0.0"
    t.decimal "evasão", precision: 2, scale: 2, default: "0.0"
    t.decimal "preecisão", precision: 2, scale: 2, default: "0.0"
    t.decimal "esquiva", precision: 2, scale: 2, default: "0.0"
    t.decimal "amplificação_de_tx", precision: 2, scale: 2, default: "0.0"
    t.decimal "taxa_critica", precision: 2, scale: 2, default: "0.0"
    t.decimal "dano_critico", precision: 3, scale: 2, default: "0.0"
    t.decimal "roubo_de_hp", precision: 2, scale: 2, default: "0.0"
    t.decimal "roubo_de_mp", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_a_taxa_critica", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_ao_dano_critico", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_a_queda", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_ao_atordoamento", precision: 2, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_character_id"], name: "index_characters_on_base_character_id"
  end

  create_table "create_user_characters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "character_id", null: false
    t.string "nome", null: false
    t.string "slug", null: false
    t.integer "hp", default: 0
    t.integer "mp", default: 0
    t.integer "ataque", default: 0
    t.integer "ataque_magico", default: 0
    t.integer "defesa", default: 0
    t.decimal "amplificação_de_dano_fisico", precision: 2, scale: 2, default: "0.0"
    t.decimal "amplificação_de_dano_magico", precision: 2, scale: 2, default: "0.0"
    t.decimal "evasão", precision: 2, scale: 2, default: "0.0"
    t.decimal "preecisão", precision: 2, scale: 2, default: "0.0"
    t.decimal "esquiva", precision: 2, scale: 2, default: "0.0"
    t.decimal "amplificação_de_tx", precision: 2, scale: 2, default: "0.0"
    t.decimal "taxa_critica", precision: 2, scale: 2, default: "0.0"
    t.decimal "dano_critico", precision: 3, scale: 2, default: "0.0"
    t.decimal "roubo_de_hp", precision: 2, scale: 2, default: "0.0"
    t.decimal "roubo_de_mp", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_a_taxa_critica", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_ao_dano_critico", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_a_queda", precision: 2, scale: 2, default: "0.0"
    t.decimal "resistencia_ao_atordoamento", precision: 2, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_create_user_characters_on_character_id"
    t.index ["user_id"], name: "index_create_user_characters_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "slug", null: false
    t.string "jti", null: false
    t.string "username", null: false
    t.string "nome", null: false
    t.string "sobrenome", null: false
    t.string "telefone", null: false
    t.date "data_nascimento", null: false
    t.integer "sexo", default: 0
    t.string "sexo_outro"
    t.decimal "qtd_gp_coin", precision: 10, scale: 2, default: "0.0"
    t.decimal "qtd_gp_cash", precision: 4, scale: 2, default: "0.0"
    t.decimal "bonus_xp", precision: 3, scale: 2, default: "0.0"
    t.decimal "bonus_rxp", precision: 3, scale: 2, default: "0.0"
    t.decimal "bonus_drop", precision: 3, scale: 2, default: "0.0"
    t.decimal "bonus_wxp", precision: 3, scale: 2, default: "0.0"
    t.decimal "bonus_gwxp", precision: 3, scale: 2, default: "0.0"
    t.decimal "bonus_crftxp", precision: 3, scale: 2, default: "0.0"
    t.decimal "bonus_petxp", precision: 3, scale: 2, default: "0.0"
    t.decimal "bonus_ep", precision: 3, scale: 2, default: "0.0"
    t.boolean "esta_online", default: false
    t.boolean "esta_ativo", default: false
    t.date "data_expiracao"
    t.integer "perfil", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "characters", "base_characters"
  add_foreign_key "create_user_characters", "characters"
  add_foreign_key "create_user_characters", "users"
end

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

ActiveRecord::Schema[7.0].define(version: 2023_04_08_220345) do
  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "encrypted_password", null: false
    t.string "slug", null: false
    t.string "unique_session_id", null: false
    t.string "jwt_token"
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jwt_token"], name: "index_users_on_jwt_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unique_session_id"], name: "index_users_on_unique_session_id", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end

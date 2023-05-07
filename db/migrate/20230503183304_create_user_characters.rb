# frozen_string_literal: true

class CreateUserCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :user_characters do |t|
      
      t.references :user, null: false, foreign_key: true, index: true
      t.references :character, null: false, foreign_key: true, index: true

      t.string :nickname, null: false
      t.string :slug, null: false

      #############################
      # HABILIDADES DO PERSONAGEM #
      #############################
      t.integer :lv, default: 1
      t.integer :energy_points, default: 0

      t.decimal :experience, default: 0, precision: 20, scale: 2
      t.decimal :group_experience, default: 0, precision: 20, scale: 2
      t.decimal :pet_experience, default: 0, precision: 20, scale: 2

      t.decimal :ruby_experience, default: 0, precision: 20, scale: 2
      
      t.decimal :war_experience, default: 0, precision: 20, scale: 2
      t.decimal :guild_war_experience, default: 0, precision: 20, scale: 2

      ##########################
      # HABILIDADES DE BATALHA #
      ##########################
      t.integer :hability_points, default: 0
      t.integer :strength, default: 0
      t.integer :wisdom, default: 0
      t.integer :devotion, default: 0
      t.integer :tenacity, default: 0
      t.integer :charisma, default: 0
      
      ########################
      # ATRIBUTOS DE BATALHA #
      ########################
      t.integer :hp, default: 0
      t.integer :mp, default: 0
      t.integer :ataque, default: 0
      t.integer :ataque_magico, default: 0
      t.integer :adicional_damage, default: 0
      t.integer :real_damage, default: 0
      t.integer :defesa, default: 0

      t.decimal :amplificação_de_dano_fisico, default: 0, precision: 2, scale: 2 # 99,99%
      t.decimal :amplificação_de_dano_magico, default: 0, precision: 2, scale: 2 # 99,99%

      t.decimal :evasão, default: 0, precision: 2, scale: 2 # 99,99%
      t.decimal :preecisão, default: 0, precision: 2, scale: 2 # 99,99%
      t.decimal :esquiva, default: 0, precision: 2, scale: 2 # 99,99%

      t.decimal :amplificação_de_tx, default: 0, precision: 2, scale: 2 # 99,99%
      t.decimal :taxa_critica, default: 0, precision: 2, scale: 2 # 99,99%
      t.decimal :dano_critico, default: 0, precision: 3, scale: 2 # 999,99%

      t.decimal :roubo_de_hp, default: 0, precision: 2, scale: 2 # 99,99%
      t.decimal :roubo_de_mp, default: 0, precision: 2, scale: 2 # 99,99%

      t.decimal :resistencia_a_taxa_critica, default: 0, precision: 2, scale: 2 # 99,99%
      t.decimal :resistencia_ao_dano_critico, default: 0, precision: 2, scale: 2 # 99,99%
      t.decimal :resistencia_a_queda, default: 0, precision: 2, scale: 2 # 99,99%
      t.decimal :resistencia_ao_atordoamento, default: 0, precision: 2, scale: 2 # 99,99%

      t.timestamps null: false
    end
  end
end

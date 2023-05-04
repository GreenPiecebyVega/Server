# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.references :base_character, null: false, foreign_key: true, index: true

      t.string :nome, null: false
      t.string :slug, null: false
      t.integer :gp_character, null: false

      t.integer :hp, default: 0
      t.integer :mp, default: 0
      t.integer :ataque, default: 0
      t.integer :ataque_magico, default: 0
      t.integer :defesa, default: 0

      t.decimal :amplificação_de_dano_fisico, default: 0, precision: 2, scale: 2 # 99,99% ADF
      t.decimal :amplificação_de_dano_magico, default: 0, precision: 2, scale: 2 # 99,99% ADM

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
      t.decimal :resistencia_ao_atordoamento, default: 0, precision: 2  # 99,99%

      t.timestamps null: false
    end
  end
end

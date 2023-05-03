class CreateBaseCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :base_characters do |t|
      t.string :nome, null: false
      t.string :slug, null: false
      t.integer :gp_character_base, null: false

      t.decimal :hp, default: 0
      t.decimal :mp, default: 0
      
      t.integer :ataque, default: 0
      t.integer :ataque_magico, default: 0
      t.integer :defesa, default: 0

      t.decimal :amplificação_de_dano_fisico, precision: 2, scale: 2 # 99,99% ADF
      t.decimal :amplificação_de_dano_magico, precision: 2, scale: 2 # 99,99% ADM
      
      t.decimal :evasão, precision: 2, scale: 2 # 99,99%
      t.decimal :preecisão, precision: 2, scale: 2 # 99,99%
      t.decimal :esquiva, default: 0, precision: 2, scale: 2 # 99,99%

      t.decimal :amplificação_de_tx # 99,99%
      t.decimal :taxa_critica, precision: 2, scale: 2 # 99,99%
      t.decimal :dano_critico, default: 0, precision: 3, scale: 2 # 999,99%

      t.decimal :roubo_de_hp, precision: 2, scale: 2 # 99,99%
      t.decimal :roubo_de_mp, precision: 2, scale: 2 # 99,99%

      t.decimal :resistencia_a_taxa_critica, precision: 2, scale: 2 # 99,99%
      t.decimal :resistencia_ao_dano_critico, precision: 2, scale: 2 # 99,99%
      t.decimal :resistencia_a_queda, precision: 2, scale: 2 # 99,99%
      t.decimal :resistencia_ao_atordoamento, precision: 2, scale: 2 # 99,99%

      t.timestamps null: false
    end
  end
end

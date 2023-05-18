class ChangeDefaultsFromTaxaCriticaEDanosCriticosFromUserCharacter < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_characters, :taxa_critica, :default => BigDecimal('5.00')
    change_column_default :user_characters, :dano_critico, :default => BigDecimal('20.00')
  end
end

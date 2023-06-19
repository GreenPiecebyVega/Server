# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Enums Traductions with i18n
  def self.humanize_enum(enum, value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum.to_s.pluralize}.#{value}")
  end

  def humanize_enum(enum)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum.to_s.pluralize}.#{send(enum)}")
  end

  # Decimal default db format
  %i[qtd_gp_coin qtd_gp_cash bonus_experience bonus_ruby_experience bonus_drop bonus_war_experience bonus_guild_war_experience bonus_energy_recovery bonus_craft_experience
    bonus_pet_experience hp mp ataque defesa ataque_magico adicional_damage real_damage amplificação_de_dano_fisico amplificação_de_dano_magico evasao precisao esquiva 
    amplificação_de_tx taxa_critica dano_critico roubo_de_hp roubo_de_mp resistencia_a_taxa_critica resistencia_ao_dano_critico resistencia_a_queda resistencia_ao_atordoamento 
    experience group_experience pet_experience ruby_experience war_experience guild_war_experience].each do |method|
   define_method "#{method}=" do |value|
     write_attribute method, (value.to_s.match(/,/) ? value.gsub('.', '').gsub(',', '.') : value)
   end
 end
end

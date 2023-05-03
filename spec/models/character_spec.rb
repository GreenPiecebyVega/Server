# == Schema Information
#
# Table name: characters
#
#  id                          :bigint           not null, primary key
#  amplificação_de_dano_fisico :decimal(2, 2)
#  amplificação_de_dano_magico :decimal(2, 2)
#  amplificação_de_tx          :decimal(10, )
#  ataque                      :integer          default(0)
#  ataque_magico               :integer          default(0)
#  dano_critico                :decimal(3, 2)    default(0.0)
#  defesa                      :integer          default(0)
#  esquiva                     :decimal(2, 2)    default(0.0)
#  evasão                      :decimal(2, 2)
#  gp_character                :integer          not null
#  hp                          :decimal(10, )    default(0)
#  mp                          :decimal(10, )    default(0)
#  nome                        :string(255)      not null
#  preecisão                   :decimal(2, 2)
#  resistencia_a_queda         :decimal(2, 2)
#  resistencia_a_taxa_critica  :decimal(2, 2)
#  resistencia_ao_atordoamento :decimal(2, 2)
#  resistencia_ao_dano_critico :decimal(2, 2)
#  roubo_de_hp                 :decimal(2, 2)
#  roubo_de_mp                 :decimal(2, 2)
#  slug                        :string(255)      not null
#  taxa_critica                :decimal(2, 2)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  base_character_id           :bigint           not null
#
# Indexes
#
#  index_characters_on_base_character_id  (base_character_id)
#
# Foreign Keys
#
#  fk_rails_...  (base_character_id => base_characters.id)
#
require 'rails_helper'

RSpec.describe Character, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

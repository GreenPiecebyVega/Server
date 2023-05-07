# frozen_string_literal: true

# == Schema Information
#
# Table name: user_characters
#
#  id                          :bigint           not null, primary key
#  amplificação_de_dano_fisico :decimal(2, 2)    default(0.0)
#  amplificação_de_dano_magico :decimal(2, 2)    default(0.0)
#  amplificação_de_tx          :decimal(2, 2)    default(0.0)
#  ataque                      :integer          default(0)
#  ataque_magico               :integer          default(0)
#  dano_critico                :decimal(3, 2)    default(0.0)
#  defesa                      :integer          default(0)
#  esquiva                     :decimal(2, 2)    default(0.0)
#  evasão                      :decimal(2, 2)    default(0.0)
#  hp                          :integer          default(0)
#  lv                          :integer          default(1)
#  mp                          :integer          default(0)
#  name                        :string(255)      not null
#  preecisão                   :decimal(2, 2)    default(0.0)
#  resistencia_a_queda         :decimal(2, 2)    default(0.0)
#  resistencia_a_taxa_critica  :decimal(2, 2)    default(0.0)
#  resistencia_ao_atordoamento :decimal(2, 2)    default(0.0)
#  resistencia_ao_dano_critico :decimal(2, 2)    default(0.0)
#  roubo_de_hp                 :decimal(2, 2)    default(0.0)
#  roubo_de_mp                 :decimal(2, 2)    default(0.0)
#  slug                        :string(255)      not null
#  taxa_critica                :decimal(2, 2)    default(0.0)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  character_id                :bigint           not null
#  user_id                     :bigint           not null
#
# Indexes
#
#  index_user_characters_on_character_id  (character_id)
#  index_user_characters_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (character_id => characters.id)
#  fk_rails_...  (user_id => users.id)
#
class UserCharacter < ApplicationRecord
  # Associations #
  belongs_to :user
  belongs_to :character
  
  has_one :inventory, class_name: 'UserCharacterInventory', foreign_key: :user_character_inventory_id, dependent: :destroy
end

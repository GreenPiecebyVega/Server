# frozen_string_literal: true

# == Schema Information
#
# Table name: characters
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
#  gp_character                :integer          not null
#  hp                          :integer          default(0)
#  mp                          :integer          default(0)
#  name                        :string(255)      not null
#  preecisão                   :decimal(2, 2)    default(0.0)
#  resistencia_a_queda         :decimal(2, 2)    default(0.0)
#  resistencia_a_taxa_critica  :decimal(2, 2)    default(0.0)
#  resistencia_ao_atordoamento :decimal(2, )     default(0)
#  resistencia_ao_dano_critico :decimal(2, 2)    default(0.0)
#  roubo_de_hp                 :decimal(2, 2)    default(0.0)
#  roubo_de_mp                 :decimal(2, 2)    default(0.0)
#  slug                        :string(255)      not null
#  taxa_critica                :decimal(2, 2)    default(0.0)
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
class Character < ApplicationRecord
  belongs_to :user
  belongs_to :base_character
  has_many :user_characters, dependent: :delete_all

  extend FriendlyId
  friendly_id :name, use: [:slugged]

  enum gp_character: %i[guerreiro guardiao mago xanter duelista arqueiro]

  scope :guerreiro, -> { where(gp_character: 1) }
  scope :guardiao, -> { where(gp_character: 2) }
  scope :mago, -> { where(gp_character: 3) }
  scope :xanter, -> { where(gp_character: 4) }
  scope :duelista, -> { where(gp_character: 5) }
  scope :arqueiro, -> { where(gp_character: 6) }

  validates :name, :name_abreviation
end

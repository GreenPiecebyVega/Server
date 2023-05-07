# frozen_string_literal: true

# == Schema Information
#
# Table name: base_characters
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
#  gp_character_base           :integer          not null
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
#
class BaseCharacter < ApplicationRecord
  belongs_to :user
  has_many :characters, dependent: :delete_all

  extend FriendlyId
  friendly_id :name, use: [:slugged]

  enum gp_character_base: %i[fisica magica]

  validates :name, presence: true
end

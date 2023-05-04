# frozen_string_literal: true
class BaseCharacter < ApplicationRecord
  has_many :characters, dependent: :delete_all

  extend FriendlyId
  friendly_id :nome, use: [:slugged]

  enum gp_character_base: %i[fisica magica]
end

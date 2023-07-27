# frozen_string_literal: true

class BaseCharacter < ApplicationRecord
  has_many :characters, class_name: 'Character', dependent: :delete_all

  enum gp_character_base: %i[physical magic]

  validates :name, presence: true
end

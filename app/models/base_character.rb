# frozen_string_literal: true

class BaseCharacter < ApplicationRecord
  belongs_to :user
  has_many :characters, dependent: :delete_all

  enum gp_character_base: %i[fisica magica]

  validates :name, presence: true
end

# frozen_string_literal: true

class GameMode < ApplicationRecord
  validates :name, :category, presence: true

  enum category: %i[moba mmorpg]
end

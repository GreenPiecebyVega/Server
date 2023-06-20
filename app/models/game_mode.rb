# frozen_string_literal: true

class GameMode < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'users_game_modes'
  has_many :users_game_modes, class_name: 'UserGameMode'

  validates :name, :category, presence: true

  enum category: %i[moba mmorpg]
end

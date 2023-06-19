class GameMode < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'users_game_modes'

  validates :name, :category, presence: true

  enum category: %i[moba mmorpg]
end

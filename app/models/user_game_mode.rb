# frozen_string_literal: true

# Here we have the user and the game mode chosed by the player.
class UserGameMode < ApplicationRecord
  belongs_to :game_mode
  belongs_to :user

  has_many :characters, class_name: 'UserCharacter', dependent: :delete_all
end

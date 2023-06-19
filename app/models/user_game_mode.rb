class UserGameMode < ApplicationRecord
  belongs_to :game_mode
  belongs_to :user

  has_many :characters, class_name: 'UserCharacter', dependent: :delete_all
end

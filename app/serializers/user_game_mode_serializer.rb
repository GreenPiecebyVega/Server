class UserGameModeSerializer < ActiveModel::Serializer
  attributes :id, :is_being_played

  belongs_to :user
  belongs_to :game_mode
end

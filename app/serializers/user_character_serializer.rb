# frozen_string_literal: true

class UserCharacterSerializer < ApplicationSerializer
  cache only: %i[id created_at]

  type :user_character

  attributes :id, :nickname, :lv, :created_at

  belongs_to :user
  belongs_to :character

  def character_list_response
    'gp'
  end
end

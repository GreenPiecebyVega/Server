# frozen_string_literal: true

class UserCharacterSerializer < ActiveModel::Serializer
  type :user_character
  attributes :id, :nickname, :lv

  belongs_to :user
  has_one :character
end

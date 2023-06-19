# frozen_string_literal: true

class UserCharacterSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :lv
end

# frozen_string_literal: true
class UserCharacter < ApplicationRecord
  belongs_to :user
  belongs_to :character
end

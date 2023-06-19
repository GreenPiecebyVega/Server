# frozen_string_literal: true

FactoryBot.define do
  # Account
  factory :user_game_mode do
    association :user, factory: :user
    association :game_mode
  end
end
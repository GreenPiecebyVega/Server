# frozen_string_literal: true

FactoryBot.define do
  # Account Characters
  factory :user_character do
    association :user, factory: :user
    association :base_character, factory: :base_character

    nickname { 'nickname' }
  end
end

# Transient attributes are essentially local variables to the factory that
# do not persist into the real created object.
# Usage:
# Controlling/altering the creation of related objects.
# Altering values assigned to other attribute assignments.

# transient do
# end

# after(:create) do |usuario, evaluator|
# end

# after(:build) do |usuario, evaluator|
# end

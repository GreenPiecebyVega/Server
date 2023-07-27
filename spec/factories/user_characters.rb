# frozen_string_literal: true

FactoryBot.define do
  # Account Characters
  factory :user_character do
    user
    character_id { 1 }
    nickname { "nickname#{SecureRandom.hex(4)}" }
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

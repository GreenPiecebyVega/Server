# frozen_string_literal: true

FactoryBot.define do
  # Account Characters
  factory :user_character do
    association :user, factory: :user

    nickname { "nickname#{SecureRandom.hex(4)}" }

    ####################
    # Traits Character #
    ####################
    trait :guerreiro do
      character_id { 1 }
    end
    trait :guardiao do
      character_id { 2 }
    end
    trait :mago do
      character_id { 3 }
    end
    trait :xanter do
      character_id { 4 }
    end
    trait :duelista do
      character_id { 5 }
    end
    trait :arqueiro do
      character_id { 6 }
    end
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

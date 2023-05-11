# frozen_string_literal: true

FactoryBot.define do
  # Account
  factory :user do
    # Attr's Obrigatórios
    name { Faker::Name.male_first_name }
    lastname { Faker::Name.last_name }
    username { 'VISHNUD3V' }
    password { 'VISHNUD3V' }
    email { Faker::Internet.email(name: SecureRandom.hex(6), separators: nil, domain: 'gmail.com') }
    data_nascimento { Date.today - 18.years }
    sexo { 'masculino' }
    sexo_outro { nil }
    telefone { Faker::PhoneNumber.cell_phone.gsub(/[^0-9]/, '') }

    ###############
    # Traits Role #
    ###############
    trait :player do
      role { 'player' }
    end
    trait :temporaria do
      role { 'temporaria' }
    end
    trait :gm do
      role { 'gm' }
    end
    trait :master do
      role { 'master' }
    end
    ###############
    # Traits Role #
    ###############
    # create(:usuario, :player, :premium)
    trait :free do
      account_type { 'free' }
    end
    trait :premium do
      account_type { 'premium' }
    end

    # Transient attributes are essentially local variables to the factory that do not persist into the created object
    # Usage:
    # Controlling/altering the creation of related objects.
    # Altering values assigned to other attribute assignments.

    # transient do
    # end

    # after(:create) do |usuario, evaluator|
    # end

    # after(:build) do |usuario, evaluator|
    # end
  end
end

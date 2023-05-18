# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Resgistrations', type: :request do
  # Subject
  let(:url) { '/users' }
  let(:user_payload) do
    {
      user: {
        name: Faker::Name.male_first_name,
        lastname: Faker::Name.last_name,
        username: 'VISHNUD3V',
        password: 'VISHNUD3V',
        email: Faker::Internet.email(name: SecureRandom.hex(6), separators: nil, domain: 'gmail.com'),
        data_nascimento: Date.today - 18.years,
        sexo: 'masculino',
        sexo_outro: nil,
        telefone: Faker::PhoneNumber.cell_phone.gsub(/[^0-9]/, '')
      }
    }
  end

  context 'when user successfuly signup' do
    it 'returns I18n.t("devise.registrations.signed_up_but_unconfirmed")' do
      post url, params: user_payload
      expect(response.body).to include(I18n.t('devise.registrations.signed_up_but_unconfirmed'))
    end
  end

  context 'when user can not singup' do
    before do
      user_payload[:user][:name] = nil
    end
    it 'responds with class errors successfuly' do
      post url, params: user_payload
      parsed = JSON.parse(response.body, object_class: OpenStruct)      
      expect(parsed.errors.count).to be >= 1
    end
  end
end

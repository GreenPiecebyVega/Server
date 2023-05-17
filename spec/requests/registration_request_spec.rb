# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /users', type: :request do
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

  context 'when user are filled correctly' do
    before do
      post url, params: user_payload
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns I18n.t("devise.registrations.signed_up_but_unconfirmed")' do
      expect(response.body).to include(I18n.t('devise.registrations.signed_up_but_unconfirmed'))
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  # Subject
  let(:user) { create(:user, :player, :free) }
  let(:user_payload) do
    {
      user: {
        login: user.email,
        password: user.password
      }
    }
  end

  context 'loggin attempt when has not confirmed e-mail yet.' do
    before do
      post user_session_path, params: user_payload
    end

    it 'responds with I18n.t(devise.failure.unconfirmed)' do
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('devise.failure.unconfirmed'))
    end
  end

  context 'when login is correct and confirmed' do
    before do
      confirm_and_sigin(user)
    end

    it 'returns I18n.t(devise.sessions.signed_in)' do
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('devise.sessions.signed_in'))
    end

    it 'returns valid JWT token' do
      token_from_request = get_jwt
      decoded_token = JWT.decode(token_from_request, ENV['DEVISE_JWT_SECRET_KEY'], true)
      expect(decoded_token.first['sub']).to be_present
    end
  end
end

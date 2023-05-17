# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /users/signin', type: :request do
  # Subject
  let(:user) { create(:user, :player, :free) }
  let(:url) { '/users/signin' }
  let(:user_payload) do
    {
      user: {
        login: user.email,
        password: user.password
      }
    }
  end

  context 'when login credentials are correct but user has not confirmed e-mail.' do
    before do
      post user_session_path, params: user_payload
    end

    it 'returns 401' do
      expect(response).to have_http_status(401)
    end

    it 'returns I18n.t("devise.failure.unconfirmed")' do
      expect(response.body).to include(I18n.t('devise.failure.unconfirmed'))
    end
  end

  context 'when login credentials are correct and user already has confirm the Account.' do
    before do
      confirm_and_sign_user(user, user_payload)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      token_from_request = response.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token_from_request, ENV['DEVISE_JWT_SECRET_KEY'], true)
      expect(decoded_token.first['sub']).to be_present
    end

    it 'returns I18n.t("devise.sessions.signed_in")' do
      expect(response.body).to include(I18n.t('devise.sessions.signed_in'))
    end
  end
end

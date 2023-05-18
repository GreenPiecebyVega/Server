# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pings', type: :request do
  let(:user) { create(:user, :player, :free) }
  let(:user_payload) do
    {
      user: {
        login: user.email,
        password: user.password
      }
    }
  end

  it 'returns a status of 200' do
    get '/ping/'
    expect(response).to have_http_status(200)
  end

  it 'Returns a status of 401 if not logged in' do
    get '/ping/auth/'
    expect(response).to have_http_status(401)
  end

  it 'Returns a status of 200 if logged in' do
    confirm_and_sign_user(user, user_payload)
    jwt = get_jwt
    get '/ping/auth/', headers: { 'Authorization': "Bearer #{jwt}" }
    expect(response).to have_http_status(200)
  end
end

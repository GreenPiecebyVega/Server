# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pings', type: :request do
  let(:user) { create(:user, :player, :free) }

  it 'returns a status of 200' do
    get ping_index_path
    expect(response).to have_http_status(200)
  end

  it 'Returns a status of 401 if not logged in' do
    get auth_ping_index_path
    expect(response).to have_http_status(401)
  end

  it 'Returns a status of 200 if logged in' do
    confirm_and_sigin(user)
    jwt = get_jwt
    get auth_ping_index_path, headers: { 'Authorization': "Bearer #{jwt}" }
    expect(response).to have_http_status(200)
  end
end

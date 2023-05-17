require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'available' do
    it 'Returns a status of 200 with no params' do
      get '/api/v1/users/available'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data).to eq(true)
    end
  end
end

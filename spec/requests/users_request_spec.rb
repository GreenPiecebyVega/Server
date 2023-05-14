require 'rails_helper'

RSpec.describe "api/v1/users", type: :request do

  context "available" do

    it 'Returns a status of 200 with no params' do
      get '/api/v1/users/available'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data).to eq(true)
    end

    it 'Returns true if username does not already exist' do      
      get "/api/v1/users/available", params: {user: { username: 'doesnotalreadyexist' }}
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data).to eq(true)
    end

    it 'Returns true if email does not already exist' do  
      get "/api/v1/users/available", params: {user: { username: 'emaildoesnotexist@gmail.com' }}
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data).to eq(true)
    end
  end
end

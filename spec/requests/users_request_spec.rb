# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'api/v1/users', type: :request do
  context 'available' do
    it 'Returns a status of 200 with no params' do
      get '/api/v1/users/available'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data).to eq(true)
    end

    it 'Returns false if username already exists' do
      create_user(username: 'testtest')
      get '/api/v1/users/available?username=testtest'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data).to eq(false)
    end

    it 'Returns true if username does not already exist' do
      create_user(username: 'testtest')
      get '/api/v1/users/available?username=testtest2'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data).to eq(true)
    end

    it 'Returns false if email already exists' do
      create_user(email: 'testtest')
      get '/api/v1/users/available?email=testtest@test.com'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data).to eq(false)
    end

    it 'Returns true if email does not already exist' do
      create_user(username: 'testtest')
      get '/api/v1/users/available?email=testtest2@test.com'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data).to eq(true)
    end
  end

  context 'show' do
    it 'Returns a status of 404 if does not exist' do
      get '/api/v1/users/name'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(404)
    end

    it 'Returns user if sending back slug' do
      user = create_user(username: 'testtest')
      get "/api/v1/users/#{user.slug}"
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data.id.to_i).to eq(user.id)
    end

    it 'Returns user if sending back id' do
      user = create_user(username: 'testtest')
      get "/api/v1/users/#{user.id}"
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data.id.to_i).to eq(user.id)
    end
  end

  context 'update' do
    it 'Requires a user' do
      user = create_user
      put "/api/v1/users/#{user.id}"
      expect(response).to have_http_status(401)
    end

    it 'Updates for the current user' do
      user = create_user(username: 'vishnudev')
      headers = get_headers(user.username)
      put("/api/v1/users/#{user.id}",
          params: '{ "user": { "username": "vishnud3v" } }',
          headers:)
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.user.username).to eq('vishnud3v')
    end

    it 'Does not update for another user' do
      user  = create_user(username: 'first_user')
      user2 = create_user(username: 'second_user')
      headers = get_headers(user2.username)
      put("/api/v1/users/#{user.id}",
          params: '{ "user": { "username": "vishnud3v" } }',
          headers:)
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.user).not_to eq('vishnud3v')
    end
  end
end

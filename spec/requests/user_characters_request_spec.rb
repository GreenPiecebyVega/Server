require 'rails_helper'

RSpec.describe 'UserCharacters', type: :request do
  let(:user) { create(:user, :player, :free) }
  let(:user_payload) do
    {
      user: {
        login: user.email,
        password: user.password
      }
    }
  end

  context 'index' do
    before do
      confirm_and_sign_user(user, user_payload)
    end

    it 'returns the user character list' do
      jwt = get_jwt
      user1 = create(:user_character, :guerreiro, user: user)
      user2 = create(:user_character, :mago, user: user)
      get '/api/v1/user/characters', headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.data.count).to be(2)
    end

    it 'responds with class errors successfuly' do
      jwt = get_jwt
      get '/api/v1/user/characters', headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include('data_not_found')
    end
  end

  context 'create' do
    before do
      confirm_and_sign_user(user, user_payload)
    end

    it 'creates the character successfuly' do
      jwt = get_jwt
      payload = {
        user_character: {
          user_id: user.id,
          character_id: 1,
          nickname: 'greenpiecebyvega'
        }
      }
      post '/api/v1/user/characters', params: payload, headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(user.character_ids).to include(parsed.data.id.to_i)
    end

    it 'responds with class errors successfuly' do
      jwt = get_jwt
      payload = {
        user_character: {
          nickname: ''
        }
      }
      post '/api/v1/user/characters', params: payload, headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be > 1
    end
  end

  context 'update' do
    before do
      confirm_and_sign_user(user, user_payload)
    end

    it 'updates the character successfuly' do
      jwt = get_jwt
      character = create(:user_character, :guerreiro, user:)
      payload = {
        user_character: {
          nickname: 'novonickname'
        }
      }
      patch "/api/v1/user/characters/#{character.id}", params: payload,
                                                       headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(user.character_ids).to include(parsed.data.id.to_i)
    end

    it 'responds with class errors successfuly' do
      jwt = get_jwt
      character = create(:user_character, :guerreiro, user:)
      payload = {
        user_character: {
          nickname: '12345' # error provoque length: { minimum: 6 }
        }
      }
      patch "/api/v1/user/characters/#{character.id}", params: payload,
                                                       headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end

  context 'destroy' do
    before do
      confirm_and_sign_user(user, user_payload)
    end

    it 'destroys the character successfuly' do
      jwt = get_jwt
      character = create(:user_character, :guerreiro, user:)
      delete "/api/v1/user/characters/#{character.id}", headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('messages.user_character.deleted'))
    end

    it 'responds with class errors successfuly' do
      jwt = get_jwt
      character = create(:user_character, :guerreiro, user:)
      character.lv = 101 # provoque callback check_character_lv
      character.save
      delete "/api/v1/user/characters/#{character.id}", headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end
end

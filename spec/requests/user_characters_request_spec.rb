require 'rails_helper'

RSpec.describe 'UserCharacters', type: :request do
  let(:user) { create(:user, :player, :free) }

  context 'index' do
    before do
      confirm_and_sigin(user)
    end

    it 'returns the user character list' do
      create(:user_character, user:)
      create(:user_character, user:)
      get api_v1_user_characters_path, headers: { 'Authorization': "Bearer #{get_jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.data.count).to be(2)
    end

    it 'responds with class errors successfuly' do
      get api_v1_user_characters_path, headers: { 'Authorization': "Bearer #{get_jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include('data_not_found')
    end
  end

  context 'create' do
    before do
      confirm_and_sigin(user)
    end

    it 'creates the character successfuly' do
      payload = {
        user_character: {
          user_id: user.id,
          character_id: Character.first.id,
          nickname: "nickname#{SecureRandom.hex(4)}"
        }
      }
      post api_v1_user_characters_path, params: payload, headers: { 'Authorization': "Bearer #{get_jwt}" }
      expect(response).to have_http_status(200)
    end

    it 'responds with class errors successfuly' do
      payload = {
        user_character: {
          user_id: user.id,
          character_id: Character.first.id,
          nickname: ''
        }
      }
      post api_v1_user_characters_path, params: payload, headers: { 'Authorization': "Bearer #{get_jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be > 1
    end
  end

  context 'update' do
    before do
      confirm_and_sigin(user)
    end

    it 'updates the character successfuly' do
      user_character = create(:user_character, user:)
      payload = {
        user_character: {
          id: user_character.id,
          nickname: "nickname#{SecureRandom.hex(4)}"
        }
      }
      patch "/api/v1/user/characters/#{user_character.id}", params: payload,
                                                            headers: { 'Authorization': "Bearer #{get_jwt}" }
      expect(response).to have_http_status(200)
    end

    it 'responds with class errors successfuly' do
      user_character = create(:user_character, user:)
      payload = {
        user_character: {
          id: user_character.id,
          nickname: ''
        }
      }
      patch "/api/v1/user/characters/#{user_character.id}", params: payload,
                                                            headers: { 'Authorization': "Bearer #{get_jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end

  context 'destroy' do
    before do
      confirm_and_sigin(user)
    end

    it 'destroys the character successfuly' do
      user_character = create(:user_character, user:)
      payload = {
        user_character: {
          id: user_character.id
        }
      }
      delete "/api/v1/user/characters/#{user_character.id}", params: payload,
                                                             headers: { 'Authorization': "Bearer #{get_jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('messages.user_character.deleted'))
    end

    it 'responds with class errors successfuly' do
      user_character = create(:user_character, user:)
      user_character.lv = 101
      user_character.save
      payload = {
        user_character: {
          id: user_character.id
        }
      }
      delete "/api/v1/user/characters/#{user_character.id}", params: payload,
                                                             headers: { 'Authorization': "Bearer #{get_jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end
end

require 'rails_helper'

RSpec.describe 'UserCharacters', type: :request do
  let(:user) { create(:user, :player, :free) }
  let(:game_mode) { GameMode.find_by(category: 'moba') }
  let(:user_game_mode) { create(:user_game_mode, user: user, game_mode: game_mode) }

  context 'index' do
    before do
      confirm_and_sigin(user)
    end

    it 'returns the user character list' do
      jwt = get_jwt
      create(:user_character, :guerreiro, user_game_mode: user_game_mode)
      create(:user_character, :mago, user_game_mode: user_game_mode)
      get api_v1_user_characters_path, headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.data.count).to be(2)
    end

    it 'responds with class errors successfuly' do
      jwt = get_jwt
      get api_v1_user_characters_path, headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include('data_not_found')
    end
  end

  context 'create' do
    before do
      confirm_and_sigin(user)
    end

    it 'creates the character successfuly' do
      jwt = get_jwt
      payload = {
        user_character: {
          user_game_mode_id: user_game_mode.id,
          character_id: Character.first.id,
          nickname: 'greenpiecebyvega'
        }
      }
      post api_v1_user_characters_path, params: payload, headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(user_game_mode.character_ids).to include(parsed.data.id.to_i)
    end

    it 'responds with class errors successfuly' do
      jwt = get_jwt
      payload = {
        user_character: {
          user_game_mode_id: user_game_mode.id,
          character_id: Character.first.id,
          nickname: ''
        }
      }
      post api_v1_user_characters_path, params: payload, headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be > 1
    end
  end

  context 'update' do
    before do
      confirm_and_sigin(user)
    end

    it 'updates the character successfuly' do
      jwt = get_jwt
      character = create(:user_character, :guerreiro, user_game_mode: user_game_mode)
      payload = {
        user_character: {
          nickname: 'novonickname'
        }
      }
      patch "/api/v1/user/characters/#{character.id}", params: payload,
                                                       headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(user_game_mode.character_ids).to include(parsed.data.id.to_i)
    end

    it 'responds with class errors successfuly' do
      jwt = get_jwt
      character = create(:user_character, :guerreiro, user_game_mode: user_game_mode)
      payload = {
        user_character: {
          nickname: '12345' # length: { minimum: 6 }
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
      confirm_and_sigin(user)
    end

    it 'destroys the character successfuly' do
      jwt = get_jwt
      character = create(:user_character, :guerreiro, user_game_mode: user_game_mode)
      delete "/api/v1/user/characters/#{character.id}", headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('messages.user_character.deleted'))
    end

    it 'responds with class errors successfuly' do
      jwt = get_jwt
      character = create(:user_character, :guerreiro, user_game_mode: user_game_mode)
      character.lv = 101 # provoque callback check_character_lv
      character.save
      delete "/api/v1/user/characters/#{character.id}", headers: { 'Authorization': "Bearer #{jwt}" }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end
end

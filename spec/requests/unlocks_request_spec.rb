# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Unlocks', type: :request do
  let(:user) { create(:user, :player, :free) }

  context 'create' do
    it 'returns I18n.t(devise.unlocoks.send_instructions)' do
      user.lock_access!
      post user_unlock_path, params: { user: { email: user.email } }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('devise.unlocks.send_instructions'))
    end

    it 'responds with class errors successfuly' do
      post user_unlock_path, params: { user: { email: '' } }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end

  context 'show' do
    it 'returns I18n.t(devise.unlocks.unlocked)' do
      eac = user.lock_access!
      get '/api/v1/users/unlock', params: { unlock_token: eac }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('devise.unlocks.unlocked'))
    end

    it 'responds with class errors successfuly' do
      get '/api/v1/users/unlock', params: { unlock_token: 'wrong_one' }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end
end

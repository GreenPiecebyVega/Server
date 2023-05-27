# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Passwords', type: :request do
  let(:user) { create(:user, :player, :free) }

  context 'create' do
    it 'returns I18n.t(devise.passwords.send_instructions)' do
      post user_password_path, params: { user: { email: user.email } }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('devise.passwords.send_instructions'))
    end

    it 'responds with class errors successfuly' do
      post user_password_path, params: { user: { email: 'wrongemail' } }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end

  context 'update' do
    it 'returns I18n.t(devise.passwords.send_instructions)' do
      token = user.send_reset_password_instructions
      patch user_password_path,
            params: { user: { reset_password_token: token, password: 'strongpassword',
                              password_confirmation: 'strongpassword' } }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('devise.passwords.updated'))
    end

    it 'responds with class errors successfuly' do
      token = user.send_reset_password_instructions
      patch user_password_path,
            params: { user: { reset_password_token: 'invalidtoken', password: 'strongpassword',
                              password_confirmation: 'strongpassword' } }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end
end

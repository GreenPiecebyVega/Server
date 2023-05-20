# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Confirmations', type: :request do
  # Subject
  let(:user) { create(:user, :player, :free) }

  context 'create' do
    it 'returns I18n.t(devise.confirmations.resent)' do
      post user_confirmation_path, params: { user: { email: user.email } }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('devise.confirmations.resent'))
    end

    it 'responds with class errors successfuly' do
      post user_confirmation_path, params: { user: { email: '' } }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end

  context 'show' do
    it 'returns I18n.t(devise.confirmations.success)' do
      get user_confirmation_show_path, params: { confirmation_token: user.confirmation_token }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.message).to include(I18n.t('devise.confirmations.success'))
    end

    it 'responds with class errors successfuly' do
      get user_confirmation_show_path, params: { confirmation_token: 'wrong_one' }
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(parsed.errors.count).to be >= 1
    end
  end
end

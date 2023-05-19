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
  end
end

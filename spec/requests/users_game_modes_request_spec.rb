# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Modo de jogo do usuário', type: :request do
  # Subject
  let(:user) { create(:user, :player, :free) }
  let(:user_game_mode) { user.users_game_modes.where(game_mode_id: 1).first }

  context 'Switch Between Game Modes' do
    before do
      confirm_and_sigin(user)
    end

    it 'updates the current game mode that the user is playing successfully' do
      payload = {
        user_game_mode: {
          id: user_game_mode.id
        }
      }
      patch api_v1_update_active_game_mode_path, params: payload, headers: { 'Authorization': "Bearer #{get_jwt}" }
      expect(response.status).to be(200)
    end
  end
end
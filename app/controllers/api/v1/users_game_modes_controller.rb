# frozen_string_literal: true

module Api
  module V1
    class UsersGameModesController < ApplicationController
      before_action :set_user_game_mode, only: %i[update_active_game_mode]
      before_action :authenticate_user!

      api :GET, 'users/game/modes/list', 'Lista dos modos de jogo do usuário'
      def index
        authorize UserGameMode
        scoped_users_game_modes = policy_scope(UserGameMode)
        if scoped_users_game_modes.present? && scoped_users_game_modes.count.positive?
          render json: scoped_users_game_modes,
                 each_serializer: UserGameModeSerializer,
                 status: 200
        else
          render json: { message: 'data_not_found' }, status: 422
        end
      rescue StandardError => e
        render json: { message: I18n.t('api.oops') }, status: 500
      end

      #############################
      # Switch Between Game Modes #
      #############################
      api :PATCH, 'users/game/modes/active-game-mode/:id', 'Atualiza o atual modo de jogo do usuário/account'
      def update_active_game_mode
        authorize @user_game_mode
        @user_game_mode.update(is_being_played: true)

        @other_users_game_modes = UserGameMode.where.not(id: @user_game_mode.id)
                                              .where(user_id: @user_game_mode.user_id)
        @other_users_game_modes.each do |obj|
          obj.update(is_being_played: false)
        end
        render json: @user_game_mode, status: 200
      rescue StandardError => e
        render json: { message: I18n.t('api.oops') }, status: 500
      end

      private

      def set_user_game_mode
        @user_game_mode = UserGameMode.find_by('id = ?', user_game_mode_params[:id])
      end

      def user_game_mode_params
        params.require(:user_game_mode).permit(
          :id,
          :user_id,
          :game_mode_id,
          :is_being_played
        )
      end
    end
  end
end

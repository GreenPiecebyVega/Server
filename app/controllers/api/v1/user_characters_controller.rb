module Api
  module V1
    class UserCharactersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user_character, only: %i[update destroy]
      
      def character_list
        authorize UserCharacter
        @user_characters = policy_scope(UserCharacter).order(lv: :desc)
        render json: { data: @user_characters }
      rescue StandardError => e
        render json: { error: I18n.t('api.oops') }, status: 500
      end

      def create
        authorize UserCharacter
        @user_characters = UserCharacter.new(user_characters_params)
        if @user_character.save
          render json: { message: I18n.t('activerecord.controllers.user_character.created')}
        else
          render json: error_response(@user_character), status: 401
        end
      rescue StandardError => e
        render json: { error: I18n.t('api.oops') }, status: 500
      end

      def update
        authorize @user_character
        if @user_character.update(user_characters_params)
          render json: { message: I18n.t('activerecord.controllers.user_character.updated')}
        else
          render json: error_response(@user_character.errors), status: 401
        end
      rescue StandardError => e
        render json: { error: I18n.t('api.oops') }, status: 500
      end

      def destroy
        authorize @user_character
        if @user_character.destroy
          render json: { message: I18n.t('activerecord.controllers.user_character.deleted')}
        else
          render json: error_response(@user_character.errors), status: 401
        end
      rescue StandardError => e
        render json: { error: I18n.t('api.oops') }, status: 500
      end

      private

      def set_user_character
        @user_character = UserCharacter.friendly.find(params[:id])
      end

      def user_characters_params
        params.require(:user_character).permit(
          :user_id,
          :character_id,
          :name,
          :lv,
          :hp,
          :mp,
          :ataque,
          :ataque_magico,
          :defesa,
          :precisao,
          :evasao,
          :esquiva,
          :roubo_de_hp,
          :roubo_de_mp,
          :amplificacao_de_dano_fisico,
          :amplificacao_de_dano_magico,
          :amplificacao_de_tx,
          :taxa_critica,
          :dano_critico,
          :resistencia_a_queda,
          :resistencia_a_taxa_critica,
          :resistencia_ao_atordoamento,
          :resistencia_ao_dano_critico
        )
      end
    end
  end
end
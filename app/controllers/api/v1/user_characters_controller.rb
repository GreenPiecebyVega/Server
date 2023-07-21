# frozen_string_literal: true

module Api
  module V1
    class UserCharactersController < ApplicationController
      before_action :set_user_character, only: %i[update destroy]
      before_action :authenticate_user!

      api :GET, '/user/characters', 'Lista dos Personagens'
      def index
        authorize UserCharacter
        scoped_user_characters = policy_scope(UserCharacter)

        if scoped_user_characters.present? && scoped_user_characters.count.positive?
          render json: scoped_user_characters,
                 each_serializer: UserCharacterSerializer,
                 status: 200
        else
          render json: { message: 'data_not_found' }, status: 422
        end
      rescue StandardError => e
        render json: { message: I18n.t('api.oops') }, status: 500
      end

      api :POST, '/user/characters', 'Cria Personagem'
      def create
        authorize UserCharacter
        user_character = UserCharacter.new(user_characters_params)

        if user_character.save
          render json: user_character, status: 200
        else
          render json: user_character,
                 serializer: ActiveModel::Serializer::ErrorSerializer,
                 status: 422
        end
      rescue StandardError => e
        render json: { message: I18n.t('api.oops') }, status: 500
      end

      api :PUT, '/user/characters/:id', 'Atualiza Personagem'
      def update
        authorize @user_character

        if @user_character.update(user_characters_params)
          render json: @user_character, status: 200
        else
          render json: @user_character,
                 serializer: ActiveModel::Serializer::ErrorSerializer,
                 status: 422
        end
      rescue StandardError => e
        render json: { message: I18n.t('api.oops') }, status: 500
      end

      api :DELETE, '/user/characters/:id', 'Deleta Personagem'
      def destroy
        authorize @user_character
        if @user_character.destroy
          render json: { message: I18n.t('messages.user_character.deleted') }, status: 200
        else
          render json: @user_character,
                 serializer: ActiveModel::Serializer::ErrorSerializer,
                 status: 422
        end
      rescue StandardError => e
        render json: { message: I18n.t('api.oops') }, status: 500
      end

      private

      def set_user_character
        @user_character = UserCharacter.find_by('id = ?', user_characters_params[:id])
      end

      def user_characters_params
        params.require(:user_character).permit(
          :id,
          :character_id,
          :nickname,
          :lv,
          :energy_points,
          :experience,
          :group_experience,
          :pet_experience,
          :ruby_experience,
          :war_experience,
          :guild_war_experience,
          :hability_points,
          :strength,
          :wisdom,
          :devotion,
          :tenacity,
          :charisma,
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

# frozen_string_literal: true

module Api
  module V1
    class BaseCharactersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_permited_params, only: %i[create update destroy]

      # GET /api/v1/base-characters
      def index
        posts = policy_scope(BaseCharacters)
        render json: PostIndexSerializer.new(posts, list_options).serializable_hash.to_json
      end

      # POST /api/v1/base-characters
      def create
        authorize BaseCharacters
        post = BaseCharacter.create_base_character!(create_params, current_user)
        render json: post_show(post, { message: I18n.t('controllers.posts.created') })
      end

      # PUT /api/v1/base-characters/:id
      def update
        authorize @base_character
        post = BaseCharacter.update_base_character!(post, update_params)
        render json: post_show(post, { message: I18n.t('controllers.posts.updated') })
      end

      # DELETE /api/v1/base-characters/:id
      def destroy
        authorize @base_character
        post = BaseCharacter.delete_base_character!(base_character)
        render json: post_show(post, { message: I18n.t('controllers.posts.deleted') })
      end

      private

      def set_base_characters
        @base_characters = BaseCharacter.find(params[:id])
      end

      def set_permited_params
        params.require(:bae_character).permit(:id, :title, :content, :published_at)
      end

      def post_show(post, meta = {})
        BaseCharacters::ShowSerializer.new(post, show_options(meta)).serializable_hash.to_json
      end

      def base_characters_params
        params.require(:base_character).permit(
          :name,
          :slug,
          :class
        )
      end
    end
  end
end

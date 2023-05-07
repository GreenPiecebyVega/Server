# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, only: %i[update show destroy]

      # GET /api/v1/users/available
      def available
        free = if params[:email].present?
                 !User.where('email = ?', params[:email].downcase).exists?
               elsif params[:username].present?
                 !User.where('username = ?', params[:username].downcase).exists?
               else
                 true
               end
        render json: { data: free }
      end

      # authenticate_user!
      # GET /api/v1/users/#{slug}
      def show
        authorize @user
        render json: UserShowSerializer.new(@user).serializable_hash.to_json
      rescue ActiveRecord::RecordNotFound
        render json: { error: I18n.t('api.not_found') }, status: 404
      end

      # authenticate_user!
      # PUT /api/v1/users/#{id}
      def update
        authorize @user
        @user.update(user_params)
        render json: { message: I18n.t('activerecord.controllers.user.updated') }
      rescue StandardError => e
        render json: { error: I18n.t('api.oops') }, status: 500
      end

      # authenticate_user!
      # DELETE /api/v1/users/#{id}
      def destroy
        authorize @user
        @user.destroy
        render json: { message: I18n.t('activerecord.controllers.user.deleted') }
      rescue StandardError => e
        render json: { error: I18n.t('api.oops') }, status: 500
      end

      private

      def set_user
        @user = User.friendly.find(params[:id])
      end

      def user_params
        params.require(:user).permit(
          :username,
          :name,
          :lastname,
          :data_nascimento,
          :telefone,
          :sexo,
          :sexo_outro
        )
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[update]
      before_action :authenticate_user!, except: %i[available]

      api :GET, 'users/available', 'Busca por email ou username disponível.'
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

      api :PATCH, '/users', 'Atualiza informações Usuário/Account'
      def update
        authorize @user
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(
          :email,
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

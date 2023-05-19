# frozen_string_literal: true

class Users::UnlocksController < Devise::SessionsController
  respond_to :json

  api :POST, '/users/unlock', 'Create the unlock instructions'
  def create
    self.resource = resource_class.send_unlock_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      render json: { message: I18n.t('devise.unlocks.send_instructions') }, status: :ok
    else
      render json: resource,
             serializer: ActiveModel::Serializer::ErrorSerializer,
             status: :unprocessable_entity
    end
  end

  api :GET, '/users/unlock/:unlock_token', 'Desbloqueia a conta do usuário.'
  def show
    self.resource = resource_class.unlock_access_by_token(params[:unlock_token])
    yield resource if block_given?

    if resource.errors.empty?
      render json: { message: I18n.t('devise.unlocks.unlocked') }, status: :ok
    else
      render json: resource,
             serializer: ActiveModel::Serializer::ErrorSerializer,
             status: :unprocessable_entity
    end
  end
end

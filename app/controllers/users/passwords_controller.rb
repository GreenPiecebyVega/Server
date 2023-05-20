# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  respond_to :json

  api :POST, '/users/password', 'Enviar instruções de troca de senha.'
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      render json: { message: I18n.t('devise.passwords.send_instructions') }, status: :ok
    else
      render json: resource,
             serializer: ActiveModel::Serializer::ErrorSerializer,
             status: :unprocessable_entity
    end
  end

  api :PATCH, '/users/password', 'Atualiza a senha do usuário.'
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      render json: { message: I18n.t('devise.passwords.updated') }, status: :ok
    else
      set_minimum_password_length
      render json: resource,
             serializer: ActiveModel::Serializer::ErrorSerializer,
             status: :unprocessable_entity
    end
  end
end

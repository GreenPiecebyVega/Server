# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  api :POST, '/users/confirmation', 'Reenvia o token confirmation_token'
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      render json: { message: I18n.t('devise.confirmations.resent') }, status: :ok
    else
      render json: resource,
             serializer: ActiveModel::Serializer::ErrorSerializer,
             status: :unprocessable_entity
    end
  end

  api :GET, '/users/confirmation/:confirmation_token', 'Confirma usuario pelo confirmation_token'
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      render json: { message: I18n.t('devise.confirmations.success') }, status: :ok
    else
      render json: resource,
             serializer: ActiveModel::Serializer::ErrorSerializer,
             status: :ok
    end
  end
end

# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: I18n.t('devise.registrations.signed_up_but_unconfirmed')}, status: :ok
  end

  def register_failed
    render json: resource, 
           serializer: ActiveModel::Serializer::ErrorSerializer, 
           status: :ok
  end
end

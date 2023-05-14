# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { 
      code: 200,
      message: I18n.t('devise.registrations.signed_up_but_unconfirmed'),
      data: nil
    }, 
      status: :ok
  end

  def register_failed
    render json: {
      message: I18n.t('devise.registrations.failed'),
      errors: resource.errors
    }, status: :unauthorized
  end
end
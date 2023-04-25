# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def new
    render json: 'Not Allowed', status: 401
  end

  # POST /users
  # Specs No
  def create
    build_resource(sign_up_params)

    resource.save
    if resource.persisted?
      render json: { message: I18n.t('controllers.registrations.confirm') }
    else
      render json: resource.errors, status: 401
    end
  end
end

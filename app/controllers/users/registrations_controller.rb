# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _options = {})
      if resource.persisted?
        render json: {
          code: 200,
          message: 'Signed up successfully.',
          data: resource
        }, status: :ok
      else
        render json: {
          code: 200,
          message: 'User could not be created successfully.',
          status: :unprocessable_entity,
          errors: resource.errors.full_message
        }
      end
    end
  end
end

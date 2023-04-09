# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private
    def respond_with(resource, options={})
        if resource.persisted?
            render json: {
                code: 200,
                message: "Signed up successfully.",
                data: resource,
            }, status: :ok
        else
            render json: {
                code: 200,
                message: "User could not be created successfully.",
                status: :unprocessable_entity,
                errors: resource.errors.full_message
            }            
        end
    end
end

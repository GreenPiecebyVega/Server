# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  respond_to :json
  
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      render json: { message: I18n.t('devise.passwords.send_instructions') }, status: :ok
    else
      render json: resource, 
             serializer: ActiveModel::Serializer::ErrorSerializer, 
             status: :ok
    end
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      if resource_class.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message!(:notice, flash_message)
        resource.after_database_authentication
        sign_in(resource_name, resource)
      else
        set_flash_message!(:notice, :updated_not_active)
      end
      render json: { message: I18n.t('devise.passwordss.updated') }, status: :ok
    else
      set_minimum_password_length
      render json: resource, 
             serializer: ActiveModel::Serializer::ErrorSerializer, 
             status: :ok
    end
  end
end

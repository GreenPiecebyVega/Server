# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  api :POST, '/users', 'Cadastro'
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      expire_data_after_sign_in!
      render json: { message: I18n.t('devise.registrations.signed_up_but_unconfirmed') }, status: 200
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: resource,
             serializer: ActiveModel::Serializer::ErrorSerializer,
             status: 422
    end
  end
end

# frozen_string_literal: true

require 'digest'

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _options = {})
    render json: {
      code: 200,
      message: I18n.t('devise.sessions.signed_in'),
      data: nil
    }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], ENV['DEVISE_JWT_SECRET_KEY']).first
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: 200,
        message: I18n.t('devise.sessions.signed_out')
      }, status: :ok
    else
      render json: {
        status: 401,
        message: I18n.t('devise.failure.timeout')
      }, status: :unauthorized
    end
  end
end

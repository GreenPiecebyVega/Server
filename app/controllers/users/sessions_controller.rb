# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, options={})
    render json: {
        code: 200,
        message: "Signed in Successfully.",
        data: resource,
    }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], ENV['DEVISE_JWT_SECRET_KEY'])
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: 200,
        message: 'Signed out Successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'User has no active session..'
      }, status: :unauthorized
    end
  end
end

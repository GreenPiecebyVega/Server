# frozen_string_literal: true

#
#  GP Application Controller
#
class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

  # Autorizações
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include SessionHelper

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email username password password_confirmation telefone nome sobrenome sexo
                                               sexo_outro data_nascimento])
  end

  def user_not_authorized
    render json: 'User not Authorized by Green Piece Policy.'
  end
end

# frozen_string_literal: true

#
#  GP Application Controller
#
class ApplicationController < ActionController::API
  # Autorizações
  include Pundit::Authorization
  include SessionHelper

  respond_to :json

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email username password password_confirmation nome sobrenome sexo
                                               sexo_outro data_nascimento])
  end

  def user_not_authorized
    render json: 'Você não tem permissão para realizar esta ação.'
  end
end

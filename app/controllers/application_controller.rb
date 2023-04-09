# frozen_string_literal: true

#
#  GP Application Controller
#
class ApplicationController < ActionController::API
  protect_from_forgery with: :exception

  # Autorizações
  include Pundit::Authorization
  include SessionHelper

  respond_to :json

  before_action :authenticate_user!
  before_action :store_location, unless: -> { user_signed_in? or devise_controller? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_out_path_for(resource_or_scope); end

  def after_sign_out_path_for(resource_or_scope); end

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

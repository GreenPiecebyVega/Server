# frozen_string_literal: true

class ApplicationController < ActionController::API
  # Application responds respond_to json and is protected against forgery
  include ActionController::RequestForgeryProtection
  respond_to :json
  protect_from_forgery with: :null_session
  
  # Utilizado para o scope de usuário recuperado pelo jwt
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  before_action :sign_out_bot

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email username name lastname
                                                         data_nascimento sexo sexo_outro
                                                         telefone role])
  end

  def user_not_authorized
    render json: { message: I18n.t('api.unauthorized') }, status: 404
    nil
  end

  def sign_out_bot
    return unless !devise_controller? || controller_name == 'registrations'
    return unless current_user.present? && !current_user.master?
    if (request.user_agent.blank? || request.user_agent.downcase.include?('headlesschrome')) && request.referer.blank?
      sign_out current_user
    end
  end
end

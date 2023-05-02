# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json
  
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :nome, :sobrenome,
                                                       :data_nascimento, :sexo, :sexo_outro,
                                                       :telefone, :perfil
                                                      ])
  end

  private

  def user_not_authorized
    render json: { message: I18n.t('unauthorized') }, status: 404
    return
  end
end

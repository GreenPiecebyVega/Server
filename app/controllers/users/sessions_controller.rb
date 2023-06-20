# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # Confirmações antes de logar
  prepend_before_action :check_user_confirmation, only: :create
  prepend_before_action :check_user_ban, only: :create

  respond_to :json

  api :POST, '/users/sigin', 'Login'
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?
    render json: { message: I18n.t('devise.sessions.signed_in') }, status: 200
  end

  private

  def check_user_confirmation
    if params[:user][:login].present? &&
       !User.find_by('email = ? OR username = ?', params[:user][:login], params[:user][:login]).confirmed?
      render json: { message: I18n.t('devise.failure.unconfirmed') }, status: 422
    end
  end

  def check_user_ban
    true
  end
end

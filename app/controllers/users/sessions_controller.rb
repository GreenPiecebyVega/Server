# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_user_confirmation, only: :create

  respond_to :json
  
  private
  
  def check_user_confirmation
    if params[:user][:login].present? &&
       !User.find_by("email = ? OR username = ?", params[:user][:login], params[:user][:login]).confirmed?
       render json: { message: I18n.t('devise.failure.unconfirmed') }, status: :unauthorized
    end
  end

  def respond_with(_resource, _options = {})
    render json: { message: I18n.t('devise.sessions.signed_in') }, status: :ok
  end
end

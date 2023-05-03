require 'digest'

class SessionsController < Devise::SessionsController
  respond_to :json
  
  private
  
  def respond_to_on_destroy
    log_out_success && return if current_user
    log_out_failure
  end

  def log_out_success
    render json: { message: I18n.t('devise.sessions.signed_out') }
  end

  def log_out_failure
    render json: { message: I18n.t('api.oops')}, status: :unauthorized
  end
end

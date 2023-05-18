# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :check_user_confirmation, only: :create

  respond_to :json
  

  private
  
  def check_user_confirmation
    if params[:user][:login].present? &&
       !User.find_by("email = ? OR username = ?", params[:user][:login], params[:user][:login]).confirmed?
       render json: {message: I18n.t('devise.failure.unconfirmed')},
              status: :ok
    end
  end

  def respond_with(_resource, _options = {})
    render json: {
      code: 200,
      message: I18n.t('devise.sessions.signed_in'),
      data: nil
    }, status: :ok
  end
end

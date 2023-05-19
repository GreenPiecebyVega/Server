# frozen_string_literal: true

class ErrorsController < ApplicationController
  def not_found
    render json: { message: I18n.t('activerecord.errors.not_found') }, status: :not_found
  end

  def internal_server_error
    render json: { message: I18n.t('activerecord.erros.internal_server_error') }, status: :internal_server_error
  end
end

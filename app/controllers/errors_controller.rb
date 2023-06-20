# frozen_string_literal: true

class ErrorsController < ApplicationController
  def not_found
    render json: { message: I18n.t('activerecord.errors.not_found') }, status: 404
  end

  def internal_server_error
    render json: { message: I18n.t('activerecord.errors.internal_server_error') }, status: 500
  end
end

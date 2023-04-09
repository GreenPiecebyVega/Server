# frozen_string_literal: true

class DevController < ApplicationController
  def index
    authorize @current_user
    render json: "Bem vindo #{current_user.username} #{current_user.sobrenome}"
  end
end

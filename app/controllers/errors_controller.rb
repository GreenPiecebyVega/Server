class ErrorsController < ApplicationController
    def not_found
        render json: { error: 'Rota não encontrada.' }, status: :not_found
    end
  
    def internal_server_error
        render json: { error: 'Internal Server Error' }, status: :internal_server_error
    end
  end
  
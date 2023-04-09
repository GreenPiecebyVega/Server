# frozen_string_literal: true

module SessionHelper
  # Retorna url de redirecionamento e exclui o valor da sessao
  def get_forwarding_url
    furl = session[:forwarding_url]
    session.delete(:forwarding_url)
    furl
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end

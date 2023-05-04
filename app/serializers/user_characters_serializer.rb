# frozen_string_literal: true

class UserCharactersSerializer < BaseSerializer
  
  # Request cache
  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 5.seconds
  
  # Objeto
  set_type :user_character

  # Mensagem
  attribute :message do |params|
    params[:message]
  end
end
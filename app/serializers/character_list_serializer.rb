# frozen_string_literal: true

class CharacterListSerializer < BaseSerializer
  # Request cache
  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 10.seconds

  # Objeto
  set_type :user_character

  # Mensagem
  attribute :message do |params|
    params[:message]
  end
end

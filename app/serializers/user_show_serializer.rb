# frozen_string_literal: true

class UserShowSerializer < BaseSerializer
  
  # Request cache
  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 5.seconds
  
  # Objeto
  set_type :user

  # Mensagem
  attribute :message do |params|
    params[:message]
  end

  # Data
  attributes :id,
             :nome,
             :sobrenome,
             :slug,
             :email,
             :username,
             :data_nascimento,
             :telefone,
             :sexo,
             :sexo_outro
end

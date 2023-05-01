# frozen_string_literal: true

class Characters::ShowSerializer < BaseSerializer
  attributes :id,
             :name,
             :slug,
             :class,
             :created_at
end

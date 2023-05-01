# frozen_string_literal: true

class Characters::IndexSerializer < BaseSerializer
  attributes :id,
             :name,
             :slug,
             :class,
             :created_at
end

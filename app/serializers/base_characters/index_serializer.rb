# frozen_string_literal: true

class BaseCharacters::IndexSerializer < BaseSerializer
  attributes :id,
             :name,
             :slug,
             :class,
             :created_at
end

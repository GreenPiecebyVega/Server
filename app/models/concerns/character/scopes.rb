# frozen_string_literal: true

class Character
  module Scopes
    extend ActiveSupport::Concern

    included do
      # doc here is just to be visible for now
      scope :published, lambda {
        where.not(created_at: nil)
      }
    end
  end
end

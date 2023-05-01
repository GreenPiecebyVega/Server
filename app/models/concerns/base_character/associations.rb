# frozen_string_literal: true

class BaseCharacter
  module Associations
    extend ActiveSupport::Concern

    included do
      has_many :characters
    end
  end
end

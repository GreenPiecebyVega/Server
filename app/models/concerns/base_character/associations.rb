# frozen_string_literal: true

class BaseCharacter
  module Associations
    extend ActiveSupport::Concern

    included do
      has_many :characters, dependent: :delete_all
    end
  end
end

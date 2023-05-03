# frozen_string_literal: true

module Users
  module Associations
    extend ActiveSupport::Concern

    included do
      has_many :characters, class_name: 'UserCharacter', dependent: :delete_all
    end
  end
end

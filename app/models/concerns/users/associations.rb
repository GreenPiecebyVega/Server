# frozen_string_literal: true

module Users
  module Associations
    extend ActiveSupport::Concern

    included do
      has_many :posts, dependent: :destroy
    end
  end
end

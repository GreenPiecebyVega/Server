# frozen_string_literal: true

module Posts
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :title, presence: true, allow_blank: false
      validates :content, presence: true, allow_blank: false
    end
  end
end

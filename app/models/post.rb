# frozen_string_literal: true

class Post < ApplicationRecord
  include Posts::Associations
  include Posts::Scopes
  include Posts::Logic
  include Posts::Validations

  extend FriendlyId
  friendly_id :title, use: [:slugged]
end

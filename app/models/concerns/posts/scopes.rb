# frozen_string_literal: true

module Posts
  module Scopes
    extend ActiveSupport::Concern

    included do
      scope :for_index, lambda { |params|
        query = includes(:user).order(id: :desc)
        query = query.published if params[:published].present?
        query = query.published.limit(5) if params[:rss].present?
        query
      }
      scope :published, lambda {
        where.not(published_at: nil)
      }
    end
  end
end

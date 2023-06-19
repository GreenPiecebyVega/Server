# frozen_string_literal: true

module Users
  module Associations
    extend ActiveSupport::Concern

    included do
      has_many :game_modes, class_name: 'UserGameMode', dependent: :delete_all
    end
  end
end

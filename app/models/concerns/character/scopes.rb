# frozen_string_literal: true

class Character
  module Scopes
    extend ActiveSupport::Concern

    included do
      scope :guerreiro, -> { where(gp_character: 1) }
      scope :guardiao, -> { where(gp_character: 2) }
      scope :mago, -> { where(gp_character: 3) }
      scope :xanter, -> { where(gp_character: 4) }
      scope :duelista, -> { where(gp_character: 5) }
      scope :arqueiro, -> { where(gp_character: 6) }
    end
  end
end

# frozen_string_literal: true

class BaseCharacter
  module Logic
    extend ActiveSupport::Concern

    included do
      def self.create_base_character!(base_character)
        base_character.save!
        base_character
      end

      def self.delete_base_character!(base_character)
        base_character.destroy!
        base_character
      end

      def self.update_base_character!(base_character, params)
        base_character.update!(params)
        base_character
      end
    end
  end
end

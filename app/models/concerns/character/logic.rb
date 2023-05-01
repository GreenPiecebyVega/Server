# frozen_string_literal: true

class Character
  module Logic
    extend ActiveSupport::Concern

    included do
      def self.create_character!(character, base_character, user)
        character = Character.new(character.merge({
                                                    base_character_id: base_character.id,
                                                    user_id: user.id
                                                  }))
        character.save!
        character
      end

      def self.delete_character!(character)
        character.destroy!
        character
      end

      def self.update_character!(character, params)
        character.update!(params)
        character
      end
    end
  end
end

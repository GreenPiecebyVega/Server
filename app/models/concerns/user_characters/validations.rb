# frozen_string_literal: true

module UserCharacters
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :character_id, presence: true

      validates :nickname,
                presence: true,
                length: { minimum: 6 },
                uniqueness: { case_sensitive: false }

      validate :nickname_format

      private

      # Implement bad words
      def nickname_format
        return I18n.t('models.user_character.nickname_format') unless
          nickname =~ /^[[:alnum:]]+$/ &&
          nickname.ascii_only?
      end
    end
  end
end

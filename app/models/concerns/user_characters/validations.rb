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

      validates :telefone, presence: true, length: { minimum: 10 }, uniqueness: { case_sensitive: false }

      validates_numericality_of :hability_points, less_than_or_equal_to: Integer('500')
      validates_numericality_of :strength, :tenacity, :wisdom, :devotion,
                                less_than_or_equal_to: Integer('500')
      validate :nickname_format

      private

      def nickname_format
        return I18n.t('models.user_character.nickname_format') unless nickname =~ /^[[:alnum:]]+$/ &&
                                                                      nickname.ascii_only?
      end
    end
  end
end

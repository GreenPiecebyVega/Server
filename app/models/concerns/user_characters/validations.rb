# frozen_string_literal: true

module UserCharacters
  module Validations
    extend ActiveSupport::Concern

    included do
      # Associations #
      validates :user_game_mode_id, :character_id, presence: true
      # Attr's #
      validates :nickname, presence: true,
                           length: { minimum: 6 },
                           uniqueness: { case_sensitive: false }

      validates_numericality_of :hability_points, less_than_or_equal_to: Integer('570')

      validate :nickname_format

      private

      def nickname_format
        return if nickname =~ /^[[:alnum:]]+$/ && nickname.ascii_only? && nickname =~ /^\S+$/

        errors.add(:nickname, I18n.t('activerecord.errors.models.user_character.nickname_format'))
        throw :abort
      end
    end
  end
end

# frozen_string_literal: true

module UserCharacters
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :nickname, presence: true,
                           length: { minimum: 6 },
                           uniqueness: { case_sensitive: false }

      validates_numericality_of :hability_points, less_than_or_equal_to: Integer('500')
      validates_numericality_of :strength, :tenacity, :wisdom, :devotion, less_than_or_equal_to: Integer('500')

      validate :nickname_format

      private

      def nickname_format
        if !(self.nickname =~ /^[[:alnum:]]+$/ && self.nickname.ascii_only? && self.nickname =~ /^[\S]+$/)
          errors.add(:nickname, I18n.t('activerecord.errors.models.user_character.nickname_format'))
          throw :abort
        end
      end
    end
  end
end

# frozen_string_literal: true

module Users
  module Logic
    extend ActiveSupport::Concern

    included do
      def for_display
        {
          id:,
          slug:,
          username:,
          email:
        }
      end

      def for_others
        {
          username:
        }
      end
    end
  end
end

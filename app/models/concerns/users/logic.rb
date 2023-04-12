module Users::Logic
    extend ActiveSupport::Concern
  
    included do
      def for_display
        {
          id: id,
          slug: slug,
          username: username,
          email: email
        }
      end
  
      def for_others
        {
          username: username
        }
      end
    end
  end
  
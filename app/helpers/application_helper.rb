# frozen_string_literal: true

# app/helpers/user_helper.rb
module ApplicationHelper
  def error_response(class_errors)
    {
      data: {
        errors: class_errors
      }
    }
  end
end

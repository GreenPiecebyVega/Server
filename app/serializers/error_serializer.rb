# frozen_string_literal: true

class ErrorSerializer < BaseSerializer
  attribute :message
  attribute :data_error

  def attribute
    super.merge(
      message: @object[:message],
      data_error: @object[:data_error]
    )
  end
end

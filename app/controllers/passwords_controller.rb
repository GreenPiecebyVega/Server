# frozen_string_literal: true

class PasswordsController < Devise::PasswordsController
  respond_to :json
end

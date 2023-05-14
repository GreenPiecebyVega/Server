# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  respond_to :json
end

# frozen_string_literal: true

Devise.setup do |config|
  # ==> ORM configuration
  # Load and configure the ORM.
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  config.authentication_keys = [:login]
  config.case_insensitive_keys = [:login]

  config.stretches = Rails.env.test? ? 1 : 12

  # Send a notification to the original email when the user's email is changed.
  config.send_email_changed_notification = true
  config.send_password_change_notification = true
  config.reconfirmable = true

  # ==> Configuration for :validatable
  config.password_length = 8..128

  # Email regex used to validate email formats. It simply asserts that one (and only one) @ exists.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.strip_whitespace_keys = [:email]

  # ==> Configuration for :lockable
  config.lock_strategy = :failed_attempts
  config.maximum_attempts = 4
  config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  config.reset_password_within = 1.hour

  # ==> Unlock
  config.unlock_strategy = :email
  config.unlock_in = 1.hour

  # ==> Navigation configuration
  config.navigational_formats = []

  # ==> Mailer Configuration
  config.mailer_sender = 'Green Piece MMORPG <no-reply@vegasoft.com>'

  # ==> Devise JWT
  config.jwt do |jwt|
    jwt.secret = ENV['DEVISE_JWT_SECRET_KEY']
    jwt.request_formats = {
      user: %i[nil json]
    }
    jwt.dispatch_requests = [
      ['POST', %r{api/v1/users/signin}]
    ]
    jwt.expiration_time = 14.days.to_i
  end

  # ==> Warden configuration
  config.warden do |manager|
    manager.failure_app = DeviseCustomFailure
    # ActionDispatch::Request::Session::DisabledSessionError: Your application has sessions disabled #
    manager.scope_defaults :user, store: false
  end
end

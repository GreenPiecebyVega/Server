# frozen_string_literal: true

Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = Rails.application.secrets.secret_key_base

  # ==> ORM configuration
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  config.authentication_keys = [:login]

  config.case_insensitive_keys = [:login]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 12

  # Send a notification to the original email when the user's email is changed.
  config.send_email_changed_notification = true

  # Send a notification email when the user's password is changed.
  config.send_password_change_notification = true

  # ==> Configuration for :confirmable
  # before confirming their account.
  # config.confirm_within = 3.days
  config.reconfirmable = false
  config.confirmation_keys = [:confirmation_token]

  # ==> Configuration for :rememberable
  # config.remember_for = 2.weeks

  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = false

  # ==> Configuration for :validatable
  # Range for password length.
  config.password_length = 8..128

  # Email regex used to validate email formats.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :timeoutable
  config.timeout_in = 3.hours

  # ==> Configuration for :lockable
  config.lock_strategy = :failed_attempts

  # Defines which key will be used when locking and unlocking an account
  config.unlock_keys = [:unlock_token]

  # Defines which strategy will be used to unlock an account.
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.
  config.unlock_strategy = :email

  # Number of authentication tries before locking an account if lock_strategy
  # is failed attempts.
  config.maximum_attempts = 5

  # Warn on the last attempt before the account is locked.
  config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  #
  # Defines which key will be used when recovering the password for an account
  config.reset_password_keys = [:reset_password_token]

  # Time interval you can reset your password with a reset password key.
  # Don't put a too small interval or your users won't have the time to
  # change their passwords.
  config.reset_password_within = 6.hours

  # When set to false, does not sign a user in automatically after their password is
  # reset. Defaults to true, so a user is signed in automatically after a reset.
  config.sign_in_after_reset_password = false

  # ==> Navigation configuration
  # The "*/*" below is required to match Internet Explorer requests.
  # config.navigational_formats = ['*/*', :html]

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Warden configuration
  config.warden do |manager|
    manager.failure_app = DeviseCustomFailure
  end

  # JWT #
  config.jwt do |jwt|
    jwt.secret = ENV['DEVISE_JWT_SECRET_KEY']
    jwt.dispatch_requests = [
      ['POST', %r{^/sign-in$}]
    ]
    jwt.revocation_requests = [
      ['DELETE', %r{^/sign-out$}]
    ]
    jwt.expiration_time = 7.days.to_i
    # Use default aud_header
    jwt.aud_header = 'JWT_AUD'
  end

  # MAILER #
  config.mailer_sender = 'Green Piece MMORPG <no-reply@vegasoft.com>'
end

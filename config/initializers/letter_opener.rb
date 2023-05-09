# frozen_string_literal: true

LetterOpener.configure do |config|
  # To overrider the location for message storage.
  # Default value is `tmp/letter_opener`
  config.location = Rails.root.join('tmp', 'mailers_preview')

  # To render only the message body, without any metadata or extra containers or styling.
  # Default value is `:default` that renders styled message with showing useful metadata.
  config.message_template = :light

  # To change default file URI scheme you can provide `file_uri_scheme` config.
  # It might be useful when you use WSL (Windows Subsystem for Linux) and default
  config.file_uri_scheme = 'file://///wsl$/Ubuntu-22.04'
end

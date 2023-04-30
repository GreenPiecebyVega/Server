# frozen_string_literal: true

# FriendlyId Global Configuration

FriendlyId.defaults do |config|
  # ## Reserved Words
  #
  # Some words could conflict with Rails's routes when used as slugs, or are
  # undesirable to allow as slugs. Edit this list as needed for your app.
  config.use :reserved

  config.reserved_words = %w[
    new edit index session login logout users admin
    stylesheets assets javascripts images greenpiece
    vega master perfil vishnu policy script
  ]
end

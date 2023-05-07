# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GreenPieceBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.web_console.whitelisted_ips = ENV['YOU_CONTAINER_IP_FOR_WEB_CONSOLE']

    # Configuration for the application, engines, and railties goes here.
    config.autoload_paths << Rails.root.join('lib')

    # Locale pt-BR
    config.i18n.default_locale            = :pt_BR
    config.i18n.available_locales         = %i[pt_BR]
    config.time_zone                      = 'Brasilia'
    config.active_record.default_timezone = :local

    # Generators
    config.generators do |g|
      g.test_framework :rspec
      g.view_specs false
      g.helper_specs true
      g.routing_specs true
      g.controller_specs true
      g.request_specs true
    end

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.middleware.use ActionDispatch::Flash

    # Error handler
    config.exceptions_app = routes

    # GP JOBS #
    config.active_job.queue_adapter = :sidekiq

    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options
  end
end

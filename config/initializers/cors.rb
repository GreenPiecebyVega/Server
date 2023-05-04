# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  origins = if Rails.env.development?
              [
                'localhost:3000', 'localhost:3001', '*'
              ].freeze
            else
              [
                'staging.xyz.com', 'www.xyz.com'
              ].freeze
            end
  allow do
    origins origins
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             expose: ['Authorization']
  end
end

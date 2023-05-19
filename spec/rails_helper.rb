# frozen_string_literal: true

require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

# Prevent database truncation if the environment is production
abort('The Rails environment is not running in test mode!') if Rails.env.production? || Rails.env.development?

require 'factory_bot_rails'
require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!
# require 'devise'
# require 'devise/jwt/test_helpers'
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include UserHelpers
  config.include Devise::Test::IntegrationHelpers, type: :request

  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  # Shoulda configs
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  keep_tables = %w[base_characters characters]
  config.before(:suite) do
    DatabaseCleaner[:redis].db = ENV['REDIS_URL_SIDEKIQ']
    DatabaseCleaner[:redis].strategy = :deletion
    DatabaseCleaner[:redis].clean_with(:deletion)

    DatabaseCleaner[:active_record].strategy = DatabaseCleaner::ActiveRecord::Deletion.new(except: %w[base_characters
                                                                                                      characters])
    DatabaseCleaner[:active_record].clean_with(:transaction)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end

# frozen_string_literal: true

RSpec.configure do |config|
  # Clean up tables between tests
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation, {
      except: %w[
        base_characters characters
      ]
    }
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

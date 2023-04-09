# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby
ruby '3.2.2'

# Rails
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

# Enviroment variables
gem 'dotenv-rails', require: 'dotenv/rails-now'

# Centralization of locale data collection for Ruby on Rails.
gem 'rails-i18n', '~> 7.0.0'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'jwt'

# I18n
gem 'i18n'

# Pundit
gem 'pundit'

# Rest Client
gem 'rest-client'

# Rubocop
gem 'rubocop', '~> 1.49', require: false

# Auth
gem 'devise'

group :development, :test do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem 'spring'

  # Debugger
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-rails'
  gem 'web-console', '~> 4.2'

  # Faker
  gem 'faker'

  # Rspec
  gem 'rspec-rails', '~> 6.0.0'
end

group :test do
  # Clean your ActiveRecord test databases with Database Cleaner.
  gem 'database_cleaner-active_record'
end

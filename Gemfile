# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'rails-i18n', '~> 7.0.0'

gem 'devise'
gem 'devise-jwt'
gem 'pundit'
gem 'rack-cors'

gem 'active_model_serializers', '~> 0.10.0'
gem 'rest-client'

gem 'redis'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'sidekiq-unique-jobs'
gem 'sinatra', require: nil

gem 'dotenv-rails', require: 'dotenv/rails-now'

gem 'bootsnap', require: false

group :development, :test do
  gem 'apipie-rails'
  gem 'letter_opener'
  gem 'rubocop', '~> 1.49', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'awesome_print'
  gem 'faker'
  gem 'pry'
  gem 'pry-rails'

  gem 'database_cleaner-active_record'
  gem 'database_cleaner-redis'
  gem 'factory_bot_rails', require: false
  gem 'shoulda-matchers', '~> 5.0'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'simplecov', require: false
end
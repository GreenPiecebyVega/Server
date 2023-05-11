# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'rails-i18n', '~> 7.0.0'
gem 'puma', '~> 5.0'

gem 'devise'
gem 'devise-jwt'
gem 'rack-cors'
gem 'pundit'

gem 'rest-client'
gem 'jbuilder'
gem 'jsonapi-serializer'

gem 'redis'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'sidekiq-unique-jobs'
gem 'sinatra', require: nil

gem 'mysql2', '~> 0.5'

gem 'dotenv-rails', require: 'dotenv/rails-now'

gem 'bootsnap', require: false

group :development do
  gem 'rubocop', '~> 1.49', require: false
  gem 'annotate'
  gem 'letter_opener'
  gem 'web-console', '~> 4.2'
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'awesome_print'
  gem 'faker'
  
  gem 'rspec-rails', '~> 6.0.0'
  gem 'simplecov', require: false
  gem 'database_cleaner-active_record'
  
  gem 'spring'
  gem 'spring-commands-rspec'
end

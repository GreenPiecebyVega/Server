# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'devise'
gem 'devise-jwt'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'jbuilder'
gem 'jsonapi-serializer'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rack-cors'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'rails-i18n', '~> 7.0.0'
gem 'redis'
gem 'rest-client'
gem 'rubocop', '~> 1.49', require: false
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'sidekiq-unique-jobs'
gem 'sinatra', require: nil

group :development do
  gem 'annotate'
  gem 'letter_opener'
  gem 'web-console', '~> 4.2'
end

group :development, :test do
  gem 'awesome_print'
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner-active_record'
  gem 'pry'
  gem 'pry-rails'
  gem 'rexml'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'webdrivers'
end

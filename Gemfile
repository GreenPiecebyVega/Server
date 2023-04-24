# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'tzinfo-data'
gem 'bootsnap', require: false
gem 'devise'
gem 'devise-jwt'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'friendly_id', '~> 5.4.0'
gem 'jbuilder'
gem 'jsonapi-serializer'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rack-cors'
gem 'rails-i18n', '~> 7.0.0'
gem 'rest-client'
gem 'rubocop', '~> 1.49', require: false
gem 'redis'
gem 'sidekiq'


group :development do
  gem 'annotate'
  gem 'web-console', '~> 4.2'
end

group :development, :test do
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-rails'
  gem 'rexml'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner-active_record'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

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
gem 'sitemap_generator'

group :development do
  gem 'web-console', '~> 4.2'
  gem 'annotate'
end

group :development, :test do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rexml'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-rails'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'simplecov', require: false
  gem 'database_cleaner-active_record'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

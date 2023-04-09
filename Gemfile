# frozen_string_literal: true
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

gem 'mysql2', '~> 0.5'
gem 'bootsnap', require: false
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'devise'
gem 'devise-jwt'
gem 'rack-cors'
gem 'pundit'
gem 'jbuilder'
gem 'rails-i18n', '~> 7.0.0'
gem 'redis', '~> 4.0'

gem 'rest-client'
gem 'rubocop', '~> 1.49', require: false

group :development, :test do
  gem 'awesome_print'
  gem 'faker'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'spring'
  gem 'web-console', '~> 4.2'
end

group :test do
  gem 'database_cleaner-active_record'
end

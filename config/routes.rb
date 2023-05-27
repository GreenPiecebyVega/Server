# frozen_string_literal: true

require 'sidekiq/web'
# sidekiq-specific session middleware
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: '_interslice_session'

Rails.application.routes.draw do
  root to: 'apipie/apipies#index' if Rails.env.development?

  #############
  ## SIDEKIQ ##
  #############
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    if rails.env.development?
      username == 'developer' && password == 'developer'
    else
      # ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(Rails.application.credentials.dig(:sidekiqweb, :username))) &&
      # ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(Rails.application.credentials.dig(:sidekiqweb, :password)))
    end
  end
  mount Sidekiq::Web => '/sidekiq'

  ###########
  ## Users ##
  ###########
  devise_for :users, skip: :all
  devise_scope :user do
    # UserController
    put 'api/v1/users', to: 'users#update', as: :user_update

    # Registrations
    post 'api/v1/users', to: 'users/registrations#create', as: :user_registration
    # Sessions
    post 'api/v1/users/signin', to: 'users/sessions#create', as: :user_session
    # Passwords
    post 'api/v1/users/password', to: 'users/passwords#create', as: :user_password
    patch 'api/v1/users/password', to: 'users/passwords#update', as: :update_user_password
    # Confirmations
    post 'api/v1/users/confirmation', to: 'users/confirmations#create', as: :user_confirmation
    get 'api/v1/users/confirmation', to: 'users/confirmations#show', as: :user_confirmation_show
    # Unlocks
    post 'api/v1/users/unlock', to: 'users/unlocks#create', as: :user_unlock
    get 'api/v1/users/unlock', to: 'users/unlocks#show', as: :unlock_user
  end

  ##########
  ## APIs ##
  ##########
  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          get :available
        end
      end
      resources :user_characters, path: 'user/characters', only: %i[index create update destroy]
    end
  end

  ##########
  ## Ping ##
  ##########
  # Ping to ensure server is up #
  resources :ping, only: [:index] do
    collection do
      get :auth
    end
  end

  ############
  ## ERRORS ##
  ############
  match '*unmatched', to: 'errors#not_found', via: :all
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end

# frozen_string_literal: true

require 'sidekiq/web'
# Configure Sidekiq-specific session middleware
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: '_interslice_session'

Rails.application.routes.draw do
  root to: 'apipie/apipies#index'

  #############
  ## SIDEKIQ ##
  #############
  # https://github.com/sidekiq/sidekiq/issues/4061 #
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'username' && password == 'password'
  end
  mount Sidekiq::Web => '/sidekiq'

  ###########
  ## Users ##
  ###########
  match '/users/signin', to: 'errors#not_found', via: :get
  match '/users/password/new', to: 'errors#not_found', via: :get
  match '/users/password/edit', to: 'errors#not_found', via: :get
  match '/users/cancel', to: 'errors#not_found', via: :get
  match '/users/sign_up', to: 'errors#not_found', via: :get
  match '/users/edit', to: 'errors#not_found', via: :get
  match '/users/confirmation/new', to: 'errors#not_found', via: :get
  # get /users/confirmation enabled for now on future will redirect to frontend
  devise_for :users, controllers: {
                       confirmations: 'users/confirmations',
                       passwords: 'users/passwords',
                       registrations: 'users/registrations',
                       sessions: 'users/sessions'
                     },
                     path_names: { sign_in: 'signin' }
  ##########
  ## APIs ##
  ##########
  namespace :api do
    namespace :v1 do
      resources :users, only: [:update] do
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

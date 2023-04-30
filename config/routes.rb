# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  ###########
  ## Users ##
  ###########
  get '/users/sign-in', to: 'errors#not_found', via: :all
  get '/users/password/edit', to: 'errors#not_found', via: :all
  devise_for :users,
             controllers: {
               confirmations: 'confirmations',
               passwords: 'passwords',
               registrations: 'registrations',
               sessions: 'sessions'
             },
             path_names: {
               sign_in: 'sign-in',
               sign_out: 'sign-out'
             }

  ##########
  ## Ping ##
  ##########
  # Ping to ensure server is up
  resources :ping, only: [:index] do
    collection do
      get :auth
    end
  end

  ##########
  ## APIs ##
  ##########
  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[create destroy index show update]
      resources :users, only: %i[show update] do
        collection do
          get :available
        end
      end
    end
  end

  ############
  ## ERRORS ##
  ############
  match '*unmatched', to: 'errors#not_found', via: :all
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end

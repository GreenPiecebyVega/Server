# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  ###########
  ## Users ##
  ###########
  devise_for :users,
             controllers: {
               confirmations: 'confirmations',
               passwords: 'passwords',
               registrations: 'registrations',
               sessions: 'sessions'
             },
             path_names: {
               sign_in: 'signin',
               sign_out: 'signout'
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

  # TESTES #
  namespace :users do
    get 'sign-in', to: 'sessions#new'
  end
end

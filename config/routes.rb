# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               confirmations: 'confirmations',
               passwords: 'passwords',
               registrations: 'registrations',
               sessions: 'sessions'
             }

  # Ping to ensure server is up
  resources :ping, only: [:index] do
    collection do
      get :auth
    end
  end

  # APIs
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

  namespace :users do
    get 'sign-in', to: 'sessions#new'
  end

  # Errors
  # get 'errors/not_found'
  # get 'errors/internal_server_error'
  # match '*unmatched', to: 'errors#not_found', via: :all
  # match '/404', to: 'errors#not_found', via: :all
  # match '/500', to: 'errors#internal_server_error', via: :all
end

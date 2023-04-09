# frozen_string_literal: true

Rails.application.routes.draw do

  # 
  ## Green Piece API
  # 
  namespace :api do
    namespace :v1 do
      # Posts API initial Test
      resources :posts
    end
  end

  # 
  ## Users
  # 
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
end

# frozen_string_literal: true

Rails.application.routes.draw do
  namespace "api" do
    devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'sing-up' }

    scope path: "/administration", as: 'staf' do
    
    end
  
    scope path: "/client", as: 'client' do
      
    end
  end
end

Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :experiences, only: [:new,:create, :update, :destroy]
  resources :searches, only: [:show, :new, :create, :update, :destroy]

  get '/dashboard_searches', to: 'pages#dashboard_searches', as: :dashboard_searches
  get '/dashboard_favorites', to: 'pages#dashboard_favorites', as: :dashboard_favorites
  get '/dashboard_profile', to: 'pages#dashboard_profile', as: :dashboard_profile

  # Defines the root path route ("/")
end

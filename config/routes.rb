Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :experiences, only: [:create, :update, :destroy] # do
  #   resources :searches, only: [:new, :create]
  # end
    resources :searches, only: [:new, :create, :update, :destroy]

  get '/dashboard', to: 'pages#dashboard', as: :dashboard

  # Defines the root path route ("/")
end

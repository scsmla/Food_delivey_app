Rails.application.routes.draw do

  resources :books
  root "static_page#home"

  get "/help", to: "static_page#help"
  get "/about", to: "static_page#about"
  get "/contact", to: "static_page#contact"
  get "/contact", to: "static_page#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/admin", to: "admins#index"
  get "/createre", to: "restaurants#new"
  get "/showres", to: "restaurants#show"
  get "/searchre", to: "restaurants#search"
  get "/createfo", to: "foods#new"

  resources :users
  resources :ratings
  resources :foods
  resources :restaurants
  resources :account_activations, only: [:edit]
end

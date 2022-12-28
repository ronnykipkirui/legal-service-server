Rails.application.routes.draw do
  
  # post "/signup", to: "clients#create"
  resources :clients, only:[:index, :show, :create]
  
  # waiting on serializer
  # post "/login", to: "sessions#create"
  get "/dispute_categories", to: "dispute_categories#index"
  resources :dispute_categories, only: [:create]
  resources :dispute_types, only:[:index, :create]
  
  
  # post "/advocates/signup", to: "advocates#create"
  resources :advocates, only:[:index, :show, :create]
  # post "/advocates/login", to: "sessions#create"
  
  resources :disputes, only: [:create, :index, :show, :destroy]
end


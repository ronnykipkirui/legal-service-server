Rails.application.routes.draw do
  
  post "/clients/signup", to: "clients#create"
  resources :clients, only:[:index, :show]
  
  
  post "/advocates/login", to: "sessions#advocate_session"
  delete "/advocates/logout", to: "sessions#advocate_destroy"
  post "/clients/login", to: "sessions#client_session"
  get "/dispute_categories", to: "dispute_categories#index"
  resources :dispute_categories, only: [:create]
  resources :dispute_types, only:[:index, :create]
  
  
  post "/advocates/signup", to: "advocates#create"
  resources :advocates, only:[:index, :show]
  
  
  
  resources :disputes, only: [:create, :index, :show, :destroy]
end


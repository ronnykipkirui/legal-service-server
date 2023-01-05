Rails.application.routes.draw do

 # Clients
 post "/api/clients/signup", to: "clients#create"
 get "/api/clients/me", to: "clients#show"
 get "/api/clients", to: "clients#index"

 # Sessions
 post "/api/clients/login", to: "sessions#client_login_session"
 delete "/api/clients/logout", to: "sessions#client_destroy_session" 
 post "/api/advocates/login", to: "sessions#advocate_login_session"
 delete "/api/advocates/logout", to: "sessions#advocate_destroy_session"

 # Dispute Categories
 get "/api/dispute_categories", to: "dispute_categories#index"
 post "/api/dispute_categories", to: "dispute_categories#create"

 # Dispute Types
 get "/api/dispute_types", to: "dispute_types#index"
 post "/api/dispute_types", to: "dispute_types#create"

 # Advocates
 post "/api/advocates/signup", to: "advocates#create"
 get "/api/advocates", to: "advocates#index"
 get "/api/advocates/me", to: "advocates#show"

 # Disputes
 get "/api/disputes", to: "disputes#index"
 get "/api/disputes/:id", to: "disputes#show"
 post "/api/disputes/create", to: "disputes#create"
 delete "/api/disputes/:id", to: "disputes#destroy"
 patch "/api/disputes/:id", to: "disputes#update"

end

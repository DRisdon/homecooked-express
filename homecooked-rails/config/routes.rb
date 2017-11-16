Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users/validate", to: "users#validate"
  get "/users/:id", to: "users#index_user"
  post "/users", to: "users#create"
  post "/login", to: "sessions#create"

  get "/dinners", to: "dinners#index"
  get "/dinners/invited", to: "dinners#index_invites"
  get "/dinners/hosting", to: "dinners#index_hosting"
  get "/dinners/attending", to: "dinners#index_attending"
  get "/dinners/:id", to: "dinners#show"
  post "/dinners", to: "dinners#create"
  post "/dinners/:id/accept", to: "dinners#accept"
  post "/dinners/:id/invite", to: "dinners#invite"
  delete "/dinners/:id", to: "dinners#delete"
  put "/dinners/:id", to: "dinners#update"
  delete "/dinners/:id/invites/:user_id", to: "dinners#remove_invite"
  delete "/dinners/:id/attendees/:user_id", to: "dinners#remove_attendee"

end

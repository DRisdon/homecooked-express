Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users/validate", to: "users#validate"
  get "/users/search/:query", to: "users#search"
  get "/users/:id", to: "users#index_user"
  post "/users", to: "users#create"
  post "/login", to: "sessions#create"

  get "/dinners", to: "dinners#index"
  get "/dinners/past", to: "dinners#index_past"
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

  get "recipes/:id", to: "recipes#show"
  get "recipes/search/:query", to: "recipes#search"
  post "recipes", to: "recipes#create"
  put "recipes/:id", to: "recipes#update"
  delete "recipes/:id", to: "recipes#delete"

  post "dinners/:id/comments", to: "comments#create"
  put "dinners/:dinner_id/comments/:comment_id", to: "comments#update"
  delete "dinners/:dinner_id/comments/:comment:id", to: "comments#delete"

end

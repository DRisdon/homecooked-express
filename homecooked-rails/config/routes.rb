Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users/validate", to: "users#validate"
  post "/users", to: "users#create"
  post "/login", to: "sessions#create"

  get "/dinners", to: "dinners#index"
  get "/dinners/hosting", to: "dinners#index_hosting"
  get "/dinners/attending", to: "dinners#index_attending"
  get "/dinners/:id", to: "dinners#show"
  post "/dinners", to: "dinners#create"
  post "/dinners/:id/attendees", to: "dinners#invite_attendee"

end

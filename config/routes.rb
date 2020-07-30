Rails.application.routes.draw do
  resources :habits
  resources :users, only: [:create]
  post "/login", to: "authentication#login"
  get "/profile", to: "users#profile"
  patch "/habits/:id/completed", to: "habits#mark_completed"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

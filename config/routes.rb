Rails.application.routes.draw do
  resources :articles
  resources :comments

  resources :users, only: [:create]

  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  post "/set_key", to: "users#temp_set"
  get "/get_key", to: "users#temp_get"
end

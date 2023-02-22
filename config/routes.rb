require 'sidekiq/web'
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"


Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" 
  resources :articles
  resources :comments

  resources :users, only: [:create]

  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  post "/set_key", to: "users#temp_set"
  get "/get_key", to: "users#temp_get"

  get "/test_sidekiq", to: "users#test_sidekiq"
end

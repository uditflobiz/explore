Rails.application.routes.draw do
  resources :articles
  # get 'articles/:id', to: "articles#show"

  # delete 'articles/:id', to: "articles#destroy"
end

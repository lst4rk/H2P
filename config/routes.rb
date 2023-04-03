Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "asks#index"

  resources :articles
  resources :asks

  post "create" => "asks#create"
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # Defines the root path route ("/")
  # root "articles#index"
end

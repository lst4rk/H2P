Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "asks#index"

  namespace :api, defaults: { format: :json } do
    namespace :version1 do
      resources :asks, only: %i[index show create update destroy]
    end
  end

end

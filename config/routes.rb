Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :version1 do
      root to: "asks#index"
      resources :asks, only: %i[index show create update destroy]
    end
  end

end

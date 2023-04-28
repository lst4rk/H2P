Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "asks#index"
  scope '/api/version1' do
    resources :asks
  end

end

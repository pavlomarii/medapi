Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :companies
  resources :patients do
    post :batch_create, on: :collection
  end

  post 'auth/login', to: 'authentication#login'
end

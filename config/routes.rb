Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  resources :categories
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"
end

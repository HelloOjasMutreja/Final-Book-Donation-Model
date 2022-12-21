Rails.application.routes.draw do
  get 'search', to: "search#index"
  get "user", to: "pages#user"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :categories
  resources :books do
    resources :requests
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end

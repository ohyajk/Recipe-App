Rails.application.routes.draw do
  get 'foodlists/index'
  get 'foodlists/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foodlists#index"
  resources :foods
end

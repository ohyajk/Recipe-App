Rails.application.routes.draw do
  get 'recipelists/index'
  get 'recipelists/show'
  get 'foodlists/index'
  get 'foodlists/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foodlists#index"
  resources :foodlists
  resources :recipelists
end

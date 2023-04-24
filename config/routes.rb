Rails.application.routes.draw do
  get 'recipelists/index'
  get 'recipelists/show'
  get 'foodlists/index'
  get 'foodlists/show'
  get 'recipe_foods/index'
  get 'recipe_foods/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foodlists#index"
  resources :foodlists
  resources :recipelists
  resources :recipe_foods
end

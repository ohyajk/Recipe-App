Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/index'
  get 'users/show'
  get 'recipelists/index'
  get 'recipelists/show'
  get 'foodlists/index'
  get 'foodlists/show'
  get 'recipe_foods/index'
  get 'recipe_foods/show'
  devise_for :users

  # Defines the root path route ("/")
  root "foodlists#index"
  resources :foodlists
  resources :recipelists do
    resources :recipe_foods
  end
end

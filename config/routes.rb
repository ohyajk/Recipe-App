Rails.application.routes.draw do
  get 'shopping_list/index'
  get 'shopping_list/show'
  get 'public_recipes/index'
  get 'public_recipes/show'
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

  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only:[:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:index, :show, :new, :create, :destroy]
    end
  end

  # Add the following line to include the :foods resource
  resources :foods, only: [:index, :new, :create, :destroy]
end


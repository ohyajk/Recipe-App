class PublicRecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @recipes = fetch_public_recipes
    @ingredients = load_recipe_food_ingredients
  end

  private

  def fetch_public_recipes
    Recipe.includes(:user).where(public: true).order(created_at: :desc)
  end

  def load_recipe_food_ingredients
    RecipeFood.all
  end
end

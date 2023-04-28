class ShoppingListController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @user = current_user
    @recipes = Recipe.where(user: @user)
    @ingredients = calculate_shopping_list(@recipes)
    @total_price = calculate_total_price(@ingredients)
  end

  private

  def calculate_shopping_list(recipes)
    RecipeFood.includes(food: :name).where(recipe: recipes).group_by { |ingredient| ingredient.food.name }
  end

  def calculate_total_price(ingredients)
    ingredients.sum do |_food, ingredient_list|
      ingredient_list.sum do |ingredient|
        ingredient.food.price * ingredient.quantity
      end
    end
  end
end

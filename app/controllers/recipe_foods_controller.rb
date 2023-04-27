class RecipeFoodsController < ApplicationController
  before_action :set_recipe, only: [:new, :create]
  before_action :set_recipe_food, only: [:destroy]

  def index
    @recipe_foods = Food.all
  end

  def new
    @recipe_food = @recipe.recipe_foods.new
    @user = @recipe.user
    @foods = Food.all
  end

  def create
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)

    if @recipe_food.save
      redirect_to user_recipe_path(user_id: @recipe.user_id, id: @recipe.id),
                  notice: 'Recipe food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to user_recipe_path(@recipe_food.recipe.user_id, @recipe_food.recipe_id)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end

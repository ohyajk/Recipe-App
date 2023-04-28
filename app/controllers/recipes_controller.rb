class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_recipe, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @recipes = fetch_recipes
  end

  def show
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to user_recipe_path(@recipe.user, @recipe), notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe.destroy
    redirect_to user_recipe_path(@recipe.user), notice: 'Recipe was successfully destroyed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
    redirect_to root_path if @recipe.nil?
  end

  def fetch_recipes
    if params[:user_id].present?
      Recipe.includes(recipe_foods: [:food]).where(user_id: params[:user_id]).order(:id)
    else
      Recipe.all
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end

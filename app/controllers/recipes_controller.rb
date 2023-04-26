class RecipesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[show]

  def index
    @recipes = if params[:user_id].present?
                     Recipe.includes(recipe_foods: [:food]).order(:id)
                   else
                     Recipe.all
                   end
  end

  def show
    @recipe = Recipe.find(params[:id])
    return if @recipe.nil?

    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def edit; end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      redirect_to user_recipes_path(@recipe), notice: 'Recipelist was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_recipe_path, notice: 'Recipelist was successfully destroyed.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end

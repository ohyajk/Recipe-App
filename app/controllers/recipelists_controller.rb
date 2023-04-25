class RecipelistsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[show]

  def index
    @recipelists = if params[:user_id].present?
      Recipelist.includes(recipe_foods: [:food]).order(:name).where(user_id: params[:user_id])
    else
      Recipelist.includes(recipe_foods: [:food]).order(:name)
    end


  end

  def show
    @recipelist = Recipelist.find(params[:id])
    @recipe_foods = @recipelist.recipe_foods
  end

  def new
    @recipelist = Recipelist.new
  end

  def edit; end

  def create
    @recipelist = Recipelist.new(recipelist_params)

    if @recipelist.save
      redirect_to recipelist_path(@recipelist), notice: 'Recipelist was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipelist = Recipelist.find(params[:id])
    @recipelist.destroy
    redirect_to recipelists_path, notice: 'Recipelist was successfully destroyed.'
  end

  private

  def set_recipelist
    @recipelist = Recipelist.find(params[:id])
  end

  def recipelist_params
    params.require(:recipelist).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end

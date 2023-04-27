class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :destroy]

  def index
    @foods = Food.all
    @user = current_user
  end

  def show
  end

  def destroy
    @food.destroy
    redirect_to root_path, notice: 'Food was successfully deleted.'
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      redirect_to root_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end

class FoodlistsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @food = Food.all
    @user = current_user
  end

  def show
    @food = Food.find(params[:id])
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foodlists_url, notice: 'Successfully destroyed foodlist.'
  end

  def new
    puts 'Entering new action'
    @food = Food.new
    puts "@food: #{@foodlist.inspect}"
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      redirect_to @food, notice: 'Successfully created foodlist.'
    else
      render action: 'new'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end

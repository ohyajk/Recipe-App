class FoodlistsController < ApplicationController
  def index
    @foodlist = Foodlist.all
  end

  def show
    @foodlist = Foodlist.find(params[:id])
  end

  def destroy
    @foodlist = Foodlist.find(params[:id])
    @foodlist.destroy
    redirect_to foodlists_url, notice: 'Successfully destroyed foodlist.'
  end

  def new
    puts "Entering new action"
    @foodlist = Foodlist.new
    puts "@foodlist: #{@foodlist.inspect}"
  end

  def create
    @foodlist = Foodlist.new(foodlist_params)
    if @foodlist.save
      redirect_to @foodlist, notice: 'Successfully created foodlist.'
    else
      render action: 'new'
    end
  end

  private

  def foodlist_params
    params.require(:foodlist).permit(:measurement_unit, :price, :quantity)
  end
end

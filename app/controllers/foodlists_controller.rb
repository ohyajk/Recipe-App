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
    redirect_to foodlists_url, :notice => "Successfully destroyed foodlist."
  end

  def new
    @foodlist = Foodlist.new
  end

  def create
    @foodlist = Foodlist.new(params[:foodlist])
    if @foodlist.save
      redirect_to @foodlist, :notice => "Successfully created foodlist."
    else
      render :action => 'new'
    end
  end

  private
  def foodlist_params
    params.require(:foodlist).permit(:measurement_unit, :price, :quantity)
  end
end

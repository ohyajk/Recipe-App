class FoodlistsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @foodlist = Foodlist.all
    @user = current_user
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
    puts 'Entering new action'
    @foodlist = Foodlist.new
    puts "@foodlist: #{@foodlist.inspect}"
  end

  def create
    @foodlist = Foodlist.new(foodlist_params)
    @foodlist.user_id = current_user.id

    if @foodlist.save
      redirect_to @foodlist, notice: 'Successfully created foodlist.'
    else
      render action: 'new'
    end
  end

  private

  def foodlist_params
    params.require(:foodlist).permit(:name, :measurement_unit, :price, :quantity)
  end
end

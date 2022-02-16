class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flats = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flats = Review.new(flat_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @flats = Flat.find(params[:flat_id])
    @flat.save
    redirect_to flat_path(@flat)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

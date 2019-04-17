class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(check_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(check_params)

    if @restaurant.update(check_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def index
     @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy!

    redirect_to restaurants_path
  end

  private

  def check_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end

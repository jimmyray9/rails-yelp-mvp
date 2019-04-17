class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params_check)
    @review.restaurant = Restaurant.find(params[:restaurant_id])

    @review.save
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      render :new
    end
  end

  def index

  end

  def show
    
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@review.restaurant_id)
  end

  private 
  def params_check
    params.require(:review).permit(:content, :rating)
  end
end

class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(rewiew_param)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path
    else
      render :new, status: unprocessable entity
    end
  end

  private

  def rewiew_param
    params.require(:review).permit(:rating, :content)
  end
end

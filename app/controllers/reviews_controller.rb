class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(rewiew_param)
  end

  private

  def rewiew_param
    params.require(:review).permit(:rating, :content)
  end
end

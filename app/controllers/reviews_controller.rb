class ReviewsController < ApplicationController
  before_action :set_resturant

  def index
    @reviews = @restaurant.reviews
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.new(review_params)

    if @review.save
      redirect_to @restaurant, notice: "Review was successfully created."
    else
      @reviews = @restaurant.reviews # Ensure reviews are available in the show view
      render 'restaurants/show', status: :unprocessable_entity
    end
  end


  private

  def set_resturant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end

class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/show' }
        format.js  # <-- idem
      end
    end
  end

  def show
    @review = Review.find([:id])
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

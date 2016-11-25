class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :destroy ]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.delete
  end
end

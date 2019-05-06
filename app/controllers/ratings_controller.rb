class RatingsController < ApplicationController
  before_action :logged_in_user, :exist_restaurant

  def index
    render json: "hello world"
  end

  def create
    # user_id = session[:user_id] || cookies.signed[:user_id]
    # restaurant_id = cookies.signed[:restaurant_id]
    # rating_params = ActionController::Parameters.new(rating_params)
    # rating_params = rating_params.merge(user_id: user_id, restaurant_id:restaurant_id)
    @rating = Rating.new(rating_params)
    if @rating.save
      # current_user.rating(rating_params[:restaurant_id])
      # current_restaurant.rating(rating_params[:user_id])

      current_restaurant.update_point(rating_params)
      redirect_to current_restaurant
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private
    def rating_params
      user_id = session[:user_id] || cookies.signed[:user_id]
      restaurant_id = cookies.signed[:restaurant_id]
      params.require(:rating).permit(:quality_point,:price_point,:service_point, :space_point, :location_point).merge(user_id: user_id, restaurant_id:  restaurant_id)
    end
end

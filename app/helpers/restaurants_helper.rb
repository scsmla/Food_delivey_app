module RestaurantsHelper
  def remember_res restaurantid
    cookies.permanent.signed[:restaurant_id] = restaurantid
  end

  def current_restaurant
   @current_restaurant ||= Restaurant.find_by(id: cookies.signed[:restaurant_id])
 end

  def exist_restaurant
    unless current_restaurant
      render "layouts/notfound"
    end
  end

  def rated? restaurant
    if restaurant.number_of_rated > 0
      return true
    else
      return false
    end
  end

  def calculate_avg_point restaurant
    return (restaurant.quality_point + restaurant.price_point + restaurant.space_point + restaurant.service_point + restaurant.location_point) / 5
  end

  def left_idx i
    return i * 2
  end

  def right_idx i
    return i * 2 + 1
  end
end

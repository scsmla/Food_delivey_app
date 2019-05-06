class Restaurant < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :ratings, foreign_key: "restaurant_id", dependent: :destroy
  # has_many :user_ratings, through: :users, source: ratings

  validates :name, presence: true
  validates :location, presence: true

  mount_uploader :image, RestaurantPictureUploader
  validate :image_size

  def rating user_id
    users_rating << user_id
  end

  def rated? user
    users.include?(user)
  end

  def self.search(search)
    if search
      where('LOWER(name) LIKE :search', search: "%#{search.downcase}%")
    else
      Restaurant.first(5)
    end
  end

  def calculate_new_point (current_point, new_rated_point, current_number_of_ratings)
    return (current_point + new_rated_point) / (current_number_of_ratings + 1)
  end

  def update_point params
    current_restaurant = Restaurant.find_by(id: params[:restaurant_id])
    current_quality_point = current_restaurant.quality_point
    current_service_point = current_restaurant.service_point
    current_space_point = current_restaurant.space_point
    current_price_point = current_restaurant.space_point
    current_location_point = current_restaurant.location_point
    current_number_of_ratings = current_restaurant.number_of_rated

    new_number_of_ratings = current_number_of_ratings + 1
    new_quality_point = calculate_new_point(current_quality_point, params[:quality_point].to_f, current_number_of_ratings)
    new_service_point = calculate_new_point(current_service_point, params[:service_point].to_f, current_number_of_ratings)
    new_space_point = calculate_new_point(current_space_point, params[:space_point].to_f, current_number_of_ratings)
    new_price_point = calculate_new_point(current_price_point, params[:price_point].to_f, current_number_of_ratings)
    new_price_point = calculate_new_point(current_location_point, params[:location_point].to_f, current_number_of_ratings)


    update_attribute(:number_of_rated, new_number_of_ratings)
    update_attribute(:quality_point, new_quality_point)
    update_attribute(:service_point, new_service_point)
    update_attribute(:space_point, new_space_point)
    update_attribute(:price_point, new_price_point)
    update_attribute(:location_point, new_price_point)

    # update_attribute(:reset_sent_at, Time.zone.now)
  end

  def image_size
    if image.size > Settings.maxmimum_image_size.megabytes
      errors.add(:image, t("image_size_info"))
    end
  end


end

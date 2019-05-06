class RestaurantsController < ApplicationController

  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index

  end

  def search
    @restaurants = Restaurant.search(params[:search])
  end

  def show
    remember_res params[:id]
    @foods = @restaurant.foods
    @rating = Rating.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new restaurant_params
    if @restaurant.save
      flash[:success] = t("create_restaurant_success")
      redirect_to admin_url
    else
      flash[:info] = t("failure")
      render :new
    end
  end

end
private
  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :minprice, :maxprice, :image)
  end

  def find_restaurant
    @restaurant = Restaurant.find_by(id: params[:id])

    if @restaurant.nil?
      render "layouts/notfound"
    end
  end

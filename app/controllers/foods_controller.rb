class FoodsController < ApplicationController

  def new
    @food = Food.new
    @restaurants = Restaurant.all
  end

  def create
    @food = current_restaurant.foods.build(food_params)
    if @food.save
      flash[:success] = t("food_created")
    else
      flash[:success] = t("food_created_failure")
    end
      redirect_to createfo_url
  end


  private
    def food_params
      params.require(:food).permit(:name, :image, :price)
    end
end

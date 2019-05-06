class StaticPageController < ApplicationController
  def home
    @restaurants = Restaurant.all
  end

  def help
  end

  def about
  end

  def contact
  end
end

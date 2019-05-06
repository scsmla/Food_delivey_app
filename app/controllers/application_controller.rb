class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include SessionsHelper
  include RestaurantsHelper

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = t("pls_log_in")
        redirect_to login_url
      end
    end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        unless user.admin?
          redirect_back_or user
        else
          redirect_to admin_url
        end
      else
        message = t("account_not_activated")
        message += t("check_email")
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash[:danger] = t("invalid_login")
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

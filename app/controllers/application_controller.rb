class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def require_login
    unless logged_in?
      store_location
      flash.now[:danger] = "Please log in."
      redirect_to login_path
    end
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
  
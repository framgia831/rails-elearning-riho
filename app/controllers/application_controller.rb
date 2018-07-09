class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def require_login
  	store_location
  	flash[:danger] = "Please log in."
  	redirect_to login_path
  end
end
  
class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  def destroy
    user = User.find(params[:id])
    flash[:success] = "User deleted."
    user.destroy
    redirect_to help_path
  end

  private
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end

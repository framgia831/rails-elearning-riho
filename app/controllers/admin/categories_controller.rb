class Admin::CategoriesController < ApplicationController
  before_action :admin_user

  def index
    @categories = Category.paginate(page: params[:page], per_page: 15)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "A new course has been made successfully"
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash.now[:success] = "Updated the course successfully."
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    category = Category.find(params[:id])
    flash[:success] = "The course wasss deleted."
    category.destroy
    redirect_to admin_categories_path
  end

  private
    def category_params
      params.require(:category).permit(:title, :description)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
  end
end

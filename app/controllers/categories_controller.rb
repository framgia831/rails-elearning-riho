class CategoriesController < ApplicationController
  before_action :require_login 

  def index
    @categories = Category.paginate(page: params[:page], per_page: 20)
  end

end


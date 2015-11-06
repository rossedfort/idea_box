class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Admin::Category.all
  end

  def new
    @category = current_user.categories.new
  end

  def show
    @category = Admin::Category.find(params[:id])
  end




end

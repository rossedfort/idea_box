class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Admin::Category.all
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      flash[:message] = "Successfully created #{@category.name}"
      redirect_to @category
    else
      byebug

      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  def show
    @category = Admin::Category.find(params[:id])
  end

  private

  def category_params
    params.require(:admin_category).permit(:name, :description)
  end




end

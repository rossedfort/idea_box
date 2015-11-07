class Admin::ImagesController < Admin::BaseController

  def index
    @images = Admin::Image.all
  end

  def new
    @image = current_user.images.new
  end

  def create
    @image = current_user.images.new(image_params)
    if @image.save
      flash[:message] = "Successfully created #{@image.name}"
      redirect_to @image
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  def show
    @image = Admin::Image.find(params[:id])
  end

  def destroy
    Admin::Image.find(params[:id]).destroy
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:admin_image).permit(:name, :url)
  end

end

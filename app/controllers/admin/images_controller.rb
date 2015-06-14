class Admin::ImagesController < Admin::BaseController
  def index
   @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to admin_images_path
    else
      flash.now[:errors] = category.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    flash.notice = "Image destroyed!!"

    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end

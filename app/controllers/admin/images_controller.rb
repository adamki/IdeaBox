class Admin::ImagesController < Admin::BaseController

  def new
    @image = Image.new
  end

  def index
    @images = Image.all
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to admin_images_path
    else
      flash[:problem] = "Please submit a URL"
      redirect_to new_admin_image_path
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find_by(params[:id])
    if @image.update(image_params)
      redirect_to admin_images_path
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find_by(params[:id])
    @image.delete
    redirect_to admin_images_path
  end

  private

    def image_params
      params.require(:image).permit(:url, :name)
    end
end

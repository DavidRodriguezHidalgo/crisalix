class ImagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @images = current_user.images
  end

  def new
  end

  def create
    image = current_user.images.create(file: params[:image][:file])
    if image.valid?
      redirect_to images_path, notice: "Image created"
    else
      flash[:danger] = "Please upload an image (jpg, png or jpeg). "
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.file.purge
    if @image.destroy
      redirect_to images_path, alert: "Image deleted"
    end
  end
end

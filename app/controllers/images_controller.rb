class ImagesController < ApplicationController
  def index
    @images = current_user.images
  end

  def new
  end

  def create
    if current_user.images.create(file: params[:image][:file])
      redirect_to images_path, notice: "Image created"
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.file.purge
    if @image.destroy
      redirect_to images_path, danger: "Image deleted"
    end
  end
end

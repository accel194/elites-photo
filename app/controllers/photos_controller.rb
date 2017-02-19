class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
        
  def create
      @photo = Photo.new(photo_params)
      @photo.save
      redirect_to photo_path(@photo)
  end
  
  def show
      @photo = Photo.find(params[:id])
  end
  
  def index
    @photos = Photo.all
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])
    @photo = update(photo_params)
    redirect_to photo_path(photo)
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo = Photo.destroy
    redirect_to photos_path
  end
  
  private
  def photo_params
      params.require(:photo).permit(:url,:title)
  end
end

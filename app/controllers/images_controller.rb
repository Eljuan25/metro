class ImagesController < ApplicationController
    before_action :set_image, only: %i[show edit update destroy]
  
    def index 
      @images = Image.all
    end
  
    def show
      render json: @image
    end
  
    def new
      @image = Image.new
    end
  
    def edit
    end
  
    def create
      @image = Image.new(image_params)
      if @image.save
        redirect_to @image
      else
       render json: @image
      end
    end
  
    def update 
      if @image.update(image_params)
        redirect_to @image
        
      else
        render json: @image 
      end
    end
  
    def destroy
      @image.destroy
      redirect_to images_url
    end
  
    private
    def set_image
      @image = Image.find(params[:id])
    end
  
    def image_params
      params.require(:images).permit(:Url_image,:post_id)
    end
  end
  
 
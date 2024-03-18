class ImagesController < ApplicationController
before_action :set_image, only:  %i[show edit update destroy]

def index 
    @images = Images.all

end

def show(params[:id])
end

def new
    @images = Images.new
end

def edit
end

def create
    @images = Images.new(images_params)
    if @images.save
        redirect_to @images
    else
        render :new
    end
end

def upadate 
    if @images.update(images_params)
    else
        render :edit
    end
end

def destroy
    @images.destroy
    redirect_to images_url
end

private
    def set_image
    @images = Images.find(paramas[:id])

    end

    def images_params
    paramas.requiere(:images).permit(:title,:descriptionm images_file)
    
    end
end

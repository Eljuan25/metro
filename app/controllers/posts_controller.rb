class PostsController < ApplicationController
    before_action :set_post, only: %i[show edit update destroy]

    def index
        @posts = Post.all
        render json: @posts
    end

    def show
        @post = Post.find(params[:id])
        render json:  @post
    end
    
    def new

        @post = Post.new
    end
    
    def edit
    end

    def create
        @post = Post.new(post_params)
       # binding.break

        if @post.save
            redirect_to @post
        else 
        
        render json: @post.errors.full_messages
        end
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to post_url
    end

    private
 
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:descripcion,:user_id)
    end
end

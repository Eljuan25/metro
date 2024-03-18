class PostController < ApplicationController
    before_action :set_post, only %i[show edit update destroy]

    def index
        @posts = Post.all
    end

    def show
        @posts = Post.find(params[:id])
    end
    
    def new

        @post = Post.new
    end
    
    def edit
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else 
        render :new
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
        @post = Post.fin(params[:id])

    end

    def post_params
        params.requiere(:post).permit(:title, :content)
    end
end

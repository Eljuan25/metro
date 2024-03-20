class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = Comment.all
  end

  def show
    render json: @comment
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    #binding.irb
    if @comment.save
      redirect_to @comment
    else
      render json: @comment
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comments).permit(:texto, :users_id, :posts_id)
  end
end

  
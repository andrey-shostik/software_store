class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save && Item.find_by(id: comment_params['item_id'])
      flash[:success] = 'Comment successfully created'
      redirect_to comments_path
    else
      flash[:error] = 'Invalid parameters'
      render :new
    end
  end

  def update
    if @comment.update(comment_params) && Item.find_by(id: comment_params['item_id'])
      flash[:success] = 'Comment successfully created'
      redirect_to comments_path
    else
      flash[:error] = 'Invalid parameters'
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = 'Comment successfully created'
    else
      flash[:error] = 'Something Wrong'
    end
    redirect_to comments_path
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :item_id)
    end
end

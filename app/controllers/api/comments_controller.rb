class Api::CommentsController < ApplicationController
  respond_to :json

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: status: 201
    else
      render json: @comment.errors, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:posting_id, :body)
  end
end

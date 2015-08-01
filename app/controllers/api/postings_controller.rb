class Api::PostingsController < ApplicationController
  respond_to :json

  def index
    @postings = Posting.all
    render json: @postings.to_json(include: :comments)
  end

  def show
    @posting = Posting.find(params[:id])
    render json: @posting.to_json(include: :comments)
  end

  def create
    @posting = Posting.new(posting_params)

    if @posting.save
      render json: {status: 201}
    else
      render json: @posting.errors, status: 422
    end
  end


  private

  def posting_params
    params.require(:posting).permit(:body)
  end


end

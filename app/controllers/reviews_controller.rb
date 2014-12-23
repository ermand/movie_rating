class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    # @review = Review.new
    @review = current_user.reviews.build
    respond_with(@review)
  end

  def edit
  end

  def create
    # @review = Review.new(review_params)
    @review = current_user.reviews.build(review_params)
    @review.save
    respond_with(@review)
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment, :user_id)
    end
end

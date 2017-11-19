class ReviewsController < ApplicationController
#before_action :set_review, only: [:show, :update, :destroy]
  
  def new
    @review = Review.new
  end

  def create
    if @post.save
      redirect_to :back, notice: 'Review posted.'
    else
      redirect_to :back, notice: 'Your review was not posted.'
    end
  end

  def update
    @review = Review.find params[:id]
    if @review.update(review_params)
      redirect_to :back, notice: 'Review was successfully updated.'
    else
      redirect_to :back, notice: 'Review was not updated.'
    end
  end

  def edit
  end

  def destroy
    @review.destroy
    redirect_to :back, notice: 'Review deleted'
  end

  def index
    @reviews = Review.all
  end

  def show
    #@user = User.find(params[:id])
  end

  
  private

  def review_params
    params.require(:review).permit(:person_rated,:person_rating, :comment)
  end
  
end

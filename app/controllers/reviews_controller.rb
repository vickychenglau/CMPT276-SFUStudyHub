class ReviewsController < ApplicationController
#before_action :set_review, only: [:show, :update, :destroy]
  
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    
    if @review.save
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
    @review = Review.find params[:id]
  end

  def destroy
    @review = Review.find(params[:id])        
    @review.destroy
    redirect_to :back, notice: 'Review deleted'
  end

  def index
    @reviews = Review.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(person_rated_id: @user.id)
  end

  private
  def review_params
    params.require(:review).permit(:person_rated_id,:person_rating_id, :comment)
  end
  
end

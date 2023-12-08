class ReviewsController < ApplicationController
  # before_action :set_review, only: [:edit, :update, :destroy]
  helper ReviewsHelper

  def new
    @review = Review.new
    @excursion = Excursion.find(params[:excursion_id])
    # @reviews = @excursion.reviews.order(created_at: :desc)
  end

  def create
    # raise
    @excursion = Excursion.find(params[:excursion_id])
    @review = Review.new(review_params)
    @review.excursion = @excursion
    @review.user = current_user

    if @review.save
      redirect_to excursion_path(@excursion, anchor: 'reviews'), notice: "Your review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
    @excursion = Excursion.find(params[:excursion_id])
  end

  def update
    @review = Review.find(params[:id])
    @excursion = Excursion.find(params[:excursion_id])
    if @review.update(review_params)
      redirect_to excursion_path(@excursion), notice: "Review was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to excursion_path(@review.excursion), notice: "Review was successfully deleted.", status: :see_other
    else
      redirect_to excursion_path(@review.excursion), notice: "Review could not be deleted", status: :see_other
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_rating, :excursion_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end

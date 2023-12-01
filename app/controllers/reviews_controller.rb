class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  helper ReviewsHelper

  def new
    @review = Review.new
    @excursion = Excursion.find(params[:excursion_id])
    @reviews = @excursion.reviews.order(created_at: :desc)
  end

  def create
    @excursion = Excursion.find(params[:excursion_id])
    @review = Review.new(review_params)
    @excursion.review = @review
    @user = current_user
    @review.user = @user

    if @review.save
      redirect_to excursion_path(@excursion, anchor: 'reviews'), notice: "Your review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @excursion = Excursion.find(params[:excursion_id])
  end

  def update
    @excursion = Excursion.find(params[:excursion_id])
    if @review.update(review_params)
      redirect_to excursion_path(@excursion), notice: "Review was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to excursion_path, notice: "Review was successfully deleted." }
      format.json { head :no_content }
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

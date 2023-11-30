class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @user = current_user
    @review.user = @user
    if @review.save
      redirect_to excursion_path(@review.excursion), notice: "Your review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :excursion_id)
  end
end

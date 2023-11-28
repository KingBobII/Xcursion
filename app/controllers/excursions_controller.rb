class ExcursionsController < ApplicationController
  # before_action :set_garden, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
  end

  def show
  end

  def new
    @excursion = Excursion.new
  end

  def create
    @excursion = Excursion.new(excursion_params)
    @user = current_user
    @excursion.user = @user
    if @excursion.save
      redirect_to root_path, notice: "Excursion was successfully created."
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

  def like
  end

  def dislike
  end

  private

  def excursion_params
    params.require(:excursion).permit(:title, :image, :city, :capacity, :length, :description, :category)
  end
end

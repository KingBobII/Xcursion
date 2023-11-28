class ExcursionsController < ApplicationController
  before_action :find_excursion, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @excursions = Excursion.all
  end

  def show
    @excursion = Excursion.find(params[:id])
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
    if @excursion.update(excursion_params)
      # Checks if the excursion object is successfully updated using the provided parameters.
      # '@excursion' likely refers to an instance variable holding an excursion object.

      redirect_to excursion_path, notice: 'Excursion was successfully updated.'
      # Redirects the user to a specific route after a successful update.
      # The 'notice' parameter provides a success message that will be displayed to the user.
    else
      render :edit
      # If the update fails, it renders the 'edit' view again to show errors or allow further editing.
    end
  end

  def destroy
  end

  def like
  end

  def dislike
  end

  private

  def find_excursion
    @excursion = Excursion.find(params[:id])
  end

  def excursion_params
    params.require(:excursion).permit(:title, :image, :city, :capacity, :category, :length, :description)
  end
end

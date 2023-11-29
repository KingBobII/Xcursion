class ItinerariesController < ApplicationController
  before_action :set_user_excursion
  before_action :find_itinerary, only: %i[show edit update destroy]

  def index
    @itineraries = Itinerary.all
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(user: @user, excursion: @excursion)

    if @itinerary.save
      redirect_to new_excursion_itinerary_path, notice: "Excursion was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if itinerary.update(itinerary_params)
      redirect_to itinerary_path, notice: 'Itinerary was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_path, notice: "Itinerary was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_user_excursion
    @user = User.find(params[:user_id])
    @excursion = Excursion.find(params[:excursion_id])
  end

  def find_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:excursion).permit(:start_date, :end_date, :user_id, :excursion_id, :description)
  end
end

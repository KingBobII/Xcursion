class ItineraryExcursionsController < ApplicationController
  def create
    @itinerary_excursion = ItineraryExcursion.new(itinerary_excursion_params)
    @itinerary = Itinerary.find(params[:itinerary_excursion][:itinerary_id])
    @excursion = Excursion.find(params[:itinerary_excursion][:excursion_id])
    @itinerary_excursion.excursion = @excursion
    if @itinerary_excursion.save
      redirect_to itinerary_path(@itinerary), notice: 'Itinerary successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def itinerary_excursion_params
    params.require(:itinerary_excursion).permit(:itinerary_id, :excursion_id)
  end
end

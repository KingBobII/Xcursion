class ItinerariesController < ApplicationController

  def index
    @itineraries = current_user.itineraries
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user
    excursion_ids = params[:itinerary_excursions][:excursion_ids].reject(&:empty?)
    if @itinerary.save
      excursion_ids.each do |excursion|
        ItineraryExcursion.create(excursion_id: excursion, itinerary_id: @itinerary.id)
      end
      redirect_to itineraries_path, notice: 'Itinerary successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.update(itinerary_params)
      redirect_to itinerary_path, notice: 'Itinerary successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_path, notice: "Itinerary was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :description, :excursion_ids, :user_id, :start_time, :end_time,
                                      itinerary_excursions: [:excursion_id])
  end
end

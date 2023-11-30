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
    if @itinerary.save
      redirect_to itineraries_path, notice: 'Itinerary successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    if @itinerary.update(itinerary_params)
      redirect_to excursion_itinerary_path, notice: 'Itinerary successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    head :no_content
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :description, :excursion_ids, :user_id, :start_time, :end_time)
  end
end

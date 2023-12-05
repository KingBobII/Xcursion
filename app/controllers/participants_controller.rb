class ParticipantsController < ApplicationController
  def new
    @participants = Participant.new
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    user_ids = params[:participant][:user_id].reject(&:blank?)
    # raise

    user_ids.each do |user_id|
      @participant = @itinerary.participants.create(user_id: user_id)
      @participant.rsvp = 0
    end

    if @itinerary.save
      redirect_to itinerary_path(@itinerary), notice: 'Participants successfully added to your itinerary'
    else
      # render :new, status: :unprocessable_entity
      redirect_to itinerary_path(@itinerary), alert: 'There was an error adding your participants'
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:user_id, :itinerary_id, :name)
  end
end

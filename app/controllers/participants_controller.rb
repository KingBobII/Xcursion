class ParticipantsController < ApplicationController
  def new
    @participants = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    @itinerary = Itinerary.find(params(:id))
    @participant.itinerary = @itinerary
    @user = current_user
    @participant.user = @user
    if @participant.save
      @participant.rsvp = 0
      redirect_to excursion_itinerary_path, notice: 'Participant successfully added to your itinerary'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def participant_params
    params(:participant).permit(:user_id, :itinerary_id, :name)
  end
end

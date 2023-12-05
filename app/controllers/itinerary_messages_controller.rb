class ItineraryMessagesController < ApplicationController
  def create
    # raise
    @itinerary = Itinerary.find(params[:itinerary_id])
    @itinerary_message = ItineraryMessage.new(itinerary_message_params)
    @itinerary_message.itinerary = @itinerary
    @itinerary_message.user = current_user
    if @itinerary_message.save
      ItineraryChatroomChannel.broadcast_to(
        @itinerary,
        message: render_to_string(partial: "message", locals: { message: @itinerary_message }),
        sender_id: @itinerary_message.user.id
      )
      head :ok
    else
      render "itineraries/show", status: :unprocessable_entity
    end
  end

  private

  def itinerary_message_params
    params.require(:itinerary_message).permit(:content)
  end
end

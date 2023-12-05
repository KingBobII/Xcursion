class ItineraryChatroomChannel < ApplicationCable::Channel
  def subscribed
    itinerary_chatroom = Itinerary.find(params[:id])
    stream_for itinerary_chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

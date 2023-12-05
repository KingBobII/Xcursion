class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @itinerary = Itinerary.find_by(id: @chatroom.itinerary_id)
    @message = Message.new
  end
end

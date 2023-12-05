class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @itinerary = Itinerary.find(params[:itinerary_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity, notice: "Sorry something went wrong"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

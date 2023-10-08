class MessagesController < ApplicationController
  def create
    message = current_user.messages.new(message_params)
    if message.save
      ActionCable.server.broadcast 'channel_messages', message: message.content, user: message.user.username
      head :ok
      puts "################## produce_message DONE!"
    else
      head :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end

class MessagesController < ApplicationController
  def create
    p "==================== MessagesController"
    @message = Message.new(message_params)
    @message.save
    @message = Message.new(conversation_id: @message.conversation_id)
    redirect_to new_group_conversation_path(@message.conversation_id)
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content, :conversation_id)
  end
end

class MessagesController < ApplicationController

  def new
    @messages = Message.where(conversation_id: params[:conversation_id]).order(created_at: :asc)
    @message = Message.new(conversation_id: params[:conversation_id])
    @members = Member.where(group_id: params[:group_id])
  end

  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(@message.conversation_id)
    @group = Group.find(@conversation.group_id)
    if @message.save
      redirect_to new_group_conversation_message_path(@group, @conversation)
    else
      render :new
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content, :conversation_id, :member_id)
  end
end

class ConversationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @admin_groups = Group.where(user_id: current_user.id)
    @conversations = Conversation.all
  end

  def new
    @group = params[:group_id]
    @conversation = Conversation.new(group_id: params[:group_id])
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.user_id = current_user.id
    @conversation.save
    redirect_to group_path(@conversation.group_id)
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title, :group_id)
  end
end

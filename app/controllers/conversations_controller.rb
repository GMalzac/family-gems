require 'pry'
class ConversationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @admin_groups = Group.where(user_id: current_user.id) if user_signed_in?
    @conversations = Conversation.all.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @conversation = Conversation.new(group_id: params[:group_id])
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.user_id = current_user.id
    @group = Group.find(params[:group_id])
    if @conversation.save
      redirect_to new_group_conversation_message_path(@group, @conversation)
    else
      render :new
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title, :group_id, messages_attributes: [:content, :group_id, :member_id])
  end
end

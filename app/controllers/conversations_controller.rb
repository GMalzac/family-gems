class ConversationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @admin_groups = Group.where(user_id: current_user.id)
    @conversations = Conversation.all
  end
end

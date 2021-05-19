class ConversationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @conversations = Conversation.all
  end
end

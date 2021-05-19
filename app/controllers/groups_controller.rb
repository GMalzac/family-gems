class GroupsController < ApplicationController
  def index
    @admin_groups = Groupe.where(user_id: current_user.id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    @group.save
    redirect_to group_path(@group)
  end

  def show
    @group = Group.find(params[:id])
    @conversations = @group.conversations
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end

class GroupsController < ApplicationController

  def index
    @admin_groups = Group.where(user_id: current_user.id).order(created_at: :desc)
    @group = Group.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.members.order(nick_name: :asc)
    @member = Member.new(group_id: @group.id)
    @conversations = @group.conversations.order(created_at: :desc)
  end

  private

  def group_params
    params.require(:group).permit(:name, members_attributes: [:nick_name, :group_id])
  end
end

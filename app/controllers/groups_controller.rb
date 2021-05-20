class GroupsController < ApplicationController
  def index
    @admin_groups = Groupe.where(user_id: current_user.id)
  end

  def new
    @group = Group.new
    10.times { @group.members.build }
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      @group.members.each do |member|
        member.save
      end
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.members.order(nick_name: :asc)
    @conversations = @group.conversations.order(created_at: :desc)
  end

  private

  def group_params
    params.require(:group).permit(:name, members_attributes: [:nick_name])
  end
end

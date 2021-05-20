  require 'pry'
class MembersController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @member = Member.new(group: @group)
  end
  
  def create
    @member = Member.new(member_params)
    # binding.pry
    @group = Group.find(@member.group_id)
    if @member.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end
  
  private
  
  def member_params
    params.require(:member).permit(:nick_name, :group_id)
  end
end

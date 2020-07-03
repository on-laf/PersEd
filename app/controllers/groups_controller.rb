class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    authorize @group
    if @group.save
      # think about this
      redirec_to teacher_path(current_teacher)
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:class_name, :teacher_id)
  end
end

class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    authorize @group
    if @group.save
      redirec_to groups_path
    else
      render :new
    end
  end

  def index
    @groups = policy_scope(Group)
  end

  def show; end

  def edit; end

  def update
    if @group.update(group_params)
      redirec_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirec_to groups_path
  end

  private

  def find_group
    @group = Group.find(params[:id])
    authorize @group
  end

  def group_params
    params.require(:group).permit(:class_name, :teacher_id)
  end
end

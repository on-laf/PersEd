class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]

  def new
    @group = Group.new
    authorize @group
  end

  def create
    @group = Group.new(group_params)
    @group.teacher = current_teacher
    authorize @group
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def index
    @groups = policy_scope(Group)
    @group = Group.new
    authorize @group
  end

  def show; end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path
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

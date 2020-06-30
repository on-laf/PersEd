class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = current_user
    if @teacher.save
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def index
    @teachers = Teacher.all
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name)
  end
end

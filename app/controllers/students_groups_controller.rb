class StudentsGroupsController < ApplicationController
  def new
    @student = Student.find(params[:student_id])
    @students_group = StudentsGroup.new
    authorize @students_group
  end

  def create
    @student = Student.find(params[:student_id])
    @students_group = StudentsGroup.new(students_group_params)
    @students_group.student = @student
    authorize @students_group
    if @students_group.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def destroy
    @students_group = StudentsGroup.find(params[:id])
    authorize @students_group
    @students_group.destroy
    redirect_to student_path(@students_group.student)
  end

  private

  def students_group_params
    params.require(:students_group).permit(:group_id, :student_id)
  end
end

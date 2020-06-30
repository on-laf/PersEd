class StudentsController < ApplicationController
  def index
    @students = policy_scope(Student)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    authorize @student
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user
    authorize @student
    if @student.save
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end

class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = policy_scope(Student)
  end

  def show
    authorize @student
    @students_groups = StudentsGroup.where(student: @student)
    authorize @students_groups
    @students_group = StudentsGroup.new
    authorize @students_group
    @notifications = Notification.where(recipient: current_user).unread.reverse
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
      render :new
    end
  end

  def edit
    authorize @student
  end

  def update
    authorize @student
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end

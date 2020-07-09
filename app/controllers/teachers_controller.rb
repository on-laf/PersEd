class TeachersController < ApplicationController
  before_action :find_teacher, only: [:show, :edit, :update, :destroy]

  def new
    @teacher = Teacher.new
    authorize @teacher
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = current_user
    authorize @teacher
    if @teacher.save
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def index
    @teachers = policy_scope(Teacher)
  end

  def show
    authorize @teacher
    @teacher_subject = TeacherSubject.new
    authorize @teacher_subject
    @teacher_subjects = TeacherSubject.where(teacher: @teacher)
    authorize @teacher_subjects
    @subjects = Subject.all
    @notifications = current_user.notifications
  end

  def edit
    authorize @teacher
  end

  def update
    authorize @teacher
    if @teacher.update(teacher_params)
      redirect_to teacher_path(@teacher)
    else
      render :edit
    end
  end

  # Don't think we will destroy teachers, but the user instead
  def destroy
    authorize @teacher
    @teacher.destroy
    # if we use this method, think about where to redirect it, index might not exist at all
    redirect_to teachers_path
  end

  private

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name)
  end
end

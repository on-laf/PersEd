class TeacherSubjectsController < ApplicationController
  def create
    @teacher_subject = TeacherSubject.new(teacher_subject_params)
    authorize @teacher_subject
    if @teacher_subject.save
      redirect_to teacher_path(current_teacher)
    else
      render 'teachers/show'
    end
  end

  def update
    @teacher_subject = TeacherSubject.find(params[:id])
    authorize @teacher_subject
    if @teacher_subject.update(teacher_subject_params)
      redirect_to teacher_path(current_teacher)
    else
      render 'teachers/show'
    end
  end

  def destroy
    @teacher_subject = TeacherSubject.find(params[:id])
    authorize @teacher_subject
    @teacher_subject.destroy
    redirect_to teacher_path(current_teacher)
  end

  private

  def teacher_subject_params
    params.require(:teacher_subject).permit(:teacher_id, :subject_id)
  end
end

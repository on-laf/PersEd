class TeacherSubjectsController < ApplicationController
  def create
    @teacher = Teacher.find(params[:teacher_id])
    authorize @teacher
    if params[:teacher_subject][:subject_id] != ""
      @teacher_subject = TeacherSubject.new(teacher_subject_params)
      @teacher_subject.teacher = @teacher
      authorize @teacher_subject
      if @teacher_subject.save
        redirect_to teacher_path(@teacher)
      else
        render 'teachers/show'
      end
    # else
    #   flash.alert = "choose a subject!"
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

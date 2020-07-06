class FlashcardHomeworksController < ApplicationController
  def new
    @flashcard_set = FlashcardSet.find(params[:flashcard_set_id])
    authorize @flashcard_set
    @flashcard_homework = FlashcardHomework.new
    authorize @flashcard_homework
    @groups = Group.where(teacher: current_teacher)
    authorize @groups
  end

  def create
    @flashcard_set = FlashcardSet.find(params[:flashcard_set_id])
    authorize @flashcard_set
    @flashcard_homework = FlashcardHomework.new(flashcard_homework_params)
    @flashcard_homework.flashcard_set = @flashcard_set
    authorize @flashcard_homework
    if @flashcard_homework.save
      @flashcard_homework.group.students.each do |student|
        set = StudentFlashcardSet.new(student: student, flashcard_homework: @flashcard_homework)
        set.save
        @flashcard_set.flashcard_templates.each do |flashcard|
          StudentFlashcard.create(flashcard_template: flashcard, student_flashcard_set: set, question: flashcard.question, answer: flashcard.answer)
        end
      end
      redirect_to flashcard_set_flashcard_homework_path(@flashcard_set, @flashcard_homework)
    else
      render :new
    end
  end

  def show
    @flashcard_homework = FlashcardHomework.find(params[:id])
    authorize @flashcard_homework
    # @student_flashcard_sets = @flashcard_homework.student_flashcard_sets
  end

  private

  def flashcard_homework_params
    params.require(:flashcard_homework).permit(:name, :due_date, :group_id)
  end
end

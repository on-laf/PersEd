class StudentFlashcardsController < ApplicationController
  before_action :find_student_flashcard, only: [:show, :edit, :update, :destroy, :add_feedback]

  def index
    @student_flashcards = policy_scope(StudentFlashcard)
    authorize @student_flashcards
  end

  def new
    @student_flashcard = StudentFlashcard.new
    authorize @student_flashcard
  end

  def create
    @student_flashcard = StudentFlashcard.new(student_flashcard_params)
    @student_flashcard_set = StudentFlashcardSet.find(params[:student_flashcard_set_id])
    @student_flashcard.student_flashcard_set = @student_flashcard_set
    authorize @student_flashcard
    @flashcard_homework = @student_flashcard_set.flashcard_homework
    @student_flashcards = @student_flashcard_set.student_flashcards
    if @student_flashcard.save
      redirect_to student_flashcard_set_path(@student_flashcard_set)
    else
      render "student_flashcard_sets/show"
    end
  end

  def show
    authorize @student_flashcard
    @student_flashcard_set = @student_flashcard.student_flashcard_set
    authorize @student_flashcard_set
  end

  def edit
    authorize @student_flashcard
    @student_flashcard_set = StudentFlashcardSet.find(params[:student_flashcard_set_id])
    @flashcard_homework = @student_flashcard_set.flashcard_homework
  end

  def update
    authorize @student_flashcard
    @student_flashcard_set = StudentFlashcardSet.find(params[:student_flashcard_set_id])
    if @student_flashcard.update(student_flashcard_params)
      redirect_to student_flashcard_set_path(@student_flashcard_set)
    else
      render :edit
    end
  end

  def destroy
    authorize @student_flashcard
    @student_flashcard_set = StudentFlashcardSet.find(params[:student_flashcard_set_id])
    authorize @student_flashcard_set
    @student_flashcard.destroy
    redirect_to student_flashcard_set_path(@student_flashcard_set)
  end

  def add_feedback
    authorize @student_flashcard
    @student_flashcard_set = StudentFlashcardSet.find(params[:student_flashcard_set_id])
    if @student_flashcard.update(student_flashcard_params)
      notification_feedback(@student_flashcard, @student_flashcard_set)
      redirect_to student_flashcard_set_path(@student_flashcard_set)
    else
      render :edit
    end
  end

  private

  def find_student_flashcard
    @student_flashcard = StudentFlashcard.find(params[:id])
  end

  def student_flashcard_params
    params.require(:student_flashcard).permit(:question, :answer, :student_answer, :feedback, :completed, :flashcard_template_id, :student_flashcard_set_id)
  end

  def notification_feedback(card, set)
    @group = set.flashcard_homework.group
    @students = set.flashcard_homework.group.students
    @students.each do |student|
      Notification.create(actor: current_user,
                          recipient: student.user,
                          action: 'feedback',
                          object: set,
                          notifiable: @group)
    end
  end
end

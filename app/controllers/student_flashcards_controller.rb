class StudentFlashcardsController < ApplicationController
  before_action :find_student_flashcard, only: [:show, :edit, :update, :destroy]

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
    @student_flashcard.flashcard_template = @flashcard_template
    authorize @student_flashcard
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

  private

  def find_student_flashcard
    @student_flashcard = StudentFlashcard.find(params[:id])
  end

  def student_flashcard_params
    params.require(:student_flashcard).permit(:question, :answer, :student_answer, :feedback, :completed, :flashcard_template_id, :student_flashcard_set_id)
  end
end

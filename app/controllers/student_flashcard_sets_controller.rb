class StudentFlashcardSetsController < ApplicationController
  def index
    @student_flashcard_sets = policy_scope(StudentFlashcardSet.where(student: current_student))
  end

  def show
    @student_flashcard_set = StudentFlashcardSet.find(params[:id])
    authorize @student_flashcard_set
    @student_flashcards = @student_flashcard_set.student_flashcards
    authorize @student_flashcards
    @flashcard_homework = @student_flashcard_set.flashcard_homework
    authorize @flashcard_homework
  end
end
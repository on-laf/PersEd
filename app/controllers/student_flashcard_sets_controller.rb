class StudentFlashcardSetsController < ApplicationController
  def show
    @student_flashcard_set = StudentFlashcardSet.find(params[:id])
    authorize @student_flashcard_set
    @student_flashcards = @student_flashcard_set.student_flashcards
    authorize @student_flashcards
  end
end

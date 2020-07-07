class StudentFlashcardSetsController < ApplicationController
  def show
    @student_flashcard_sets = StudentFlashcardSet.find(params[:id])
    authorize @student_flashcard_sets
  end
end

class StudentFlashcardSetsController < ApplicationController
  def index
    @student_flashcard_sets = filter_sent(policy_scope(StudentFlashcardSet).order(updated_at: :desc))
    @student_flashcard_sets_unsubmitted = filter_unsubmitted(@student_flashcard_sets)
    @student_flashcard_sets_submitted = filter_submitted(@student_flashcard_sets)
  end

  def show
    @student_flashcard_set = StudentFlashcardSet.find(params[:id])
    authorize @student_flashcard_set
    @student_flashcards = @student_flashcard_set.student_flashcards
    authorize @student_flashcards
    @flashcard_homework = @student_flashcard_set.flashcard_homework
  end

  def flop_submit
    @student_flashcard_set = StudentFlashcardSet.find(params[:id])
    @student_flashcard_set.submitted = true
    authorize @student_flashcard_set
    @student_flashcard_set.save
    redirect_to student_flashcard_sets_path
  end

  private

  def filter_sent(sets)
    sets.select { |set| set.flashcard_homework.sent }
  end

  def filter_unsubmitted(sets)
    sets.reject { |set| set.submitted }
  end

  def filter_submitted(sets)
    sets.select { |set| set.submitted }
  end
end

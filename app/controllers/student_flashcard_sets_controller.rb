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
    @ready = ready_submit?(@student_flashcard_set)
  end

  def flop_submit
    @student_flashcard_set = StudentFlashcardSet.find(params[:id])
    @student_flashcard_set.submitted = true
    authorize @student_flashcard_set
    if @student_flashcard_set.save
      notification_submit(@student_flashcard_set)
      redirect_to student_flashcard_sets_path
    else
      redirect_to @student_flashcard_set, notice: "Homework not submitted! Try again!"
    end
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

  def ready_submit?(set)
    set.student_flashcards.each do |card|
      return false if card.student_answer.nil?
    end
    return true
  end

  def notification_submit(set)
    @teacher = set.flashcard_homework.flashcard_set.teacher
    Notification.create(actor: current_user,
                        recipient: @teacher.user,
                        action: 'submit',
                        object: set,
                        notifiable: @teacher)
  end
end

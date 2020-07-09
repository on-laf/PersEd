class FlashcardHomeworksController < ApplicationController
  def new
    @flashcard_set = FlashcardSet.find(params[:flashcard_set].to_i)
    authorize @flashcard_set
    @flashcard_homework = FlashcardHomework.new
    authorize @flashcard_homework
    @groups = Group.where(teacher: current_teacher)
    authorize @groups
  end

  def create
    @flashcard_set = FlashcardSet.find(params['flashcard_homework'][:flashcard_set].to_i)
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
      redirect_to flashcard_homework_path(@flashcard_homework)
    else
      render :new
    end
  end

  def index
    if teacher?
      @flashcard_homeworks_sent = filter_sent(policy_scope(current_teacher.flashcard_homeworks).order(updated_at: :desc))
      @flashcard_homeworks_draft = filter_draft(policy_scope(current_teacher.flashcard_homeworks).order(updated_at: :desc))
    end
  end

  def show
    @flashcard_homework = FlashcardHomework.find(params[:id])
    authorize @flashcard_homework
    @student_flashcard_sets = @flashcard_homework.student_flashcard_sets
    authorize @student_flashcard_sets
    @students = @flashcard_homework.group.students
    authorize @students
  end

  # Without the scheduling functionality, drafy and sent serve exactly the same purpose
  # def flop_draft
  #   @flashcard_homework = FlashcardHomework.find(params[:id])
  #   @flashcard_homework.draft = false
  #   authorize @flashcard_homework
  #   @flashcard_homework.save
  #   redirect_to flashcard_sets_path
  # end

  def flop_send
    @flashcard_homework = FlashcardHomework.find(params[:id])
    @flashcard_homework.draft = false
    @flashcard_homework.sent = true
    authorize @flashcard_homework
    if @flashcard_homework.save
      notification_sent(@flashcard_homework)
      # rethink this redirect, it should be for the dashboard once it exists
      redirect_to flashcard_sets_path
    else
      redirect_to @flashcard_homework, notice: "Homework not sent! Try again!"
    end
  end

  private

  def filter_sent(homeworks)
    homeworks.select { |homework| homework.sent }
  end

  def filter_draft(homeworks)
    homeworks.select { |homework| homework.draft }
  end

  def flashcard_homework_params
    params.require(:flashcard_homework).permit(:name, :due_date, :group_id)
  end

  def notification_sent(homework)
    @group = homework.group
    @students = homework.group.students
    @students.each do |student|
      Notification.create(actor: current_user,
                          recipient: student.user,
                          action: 'sent',
                          message: "#{current_teacher.first_name} #{current_teacher.last_name} sent homework#{homework.due_date.nil? ? '' : homework.due_date.strftime(', due on %d/%m/%Y')}",
                          notifiable: @group)
    end
  end
end

class FlashcardSetsController < ApplicationController
  before_action :find_flashcard_set, only: [:show, :edit, :update, :destroy]

  def index
    @flashcard_sets = policy_scope(FlashcardSet)
    @flashcard_set = FlashcardSet.new
    authorize @flashcard_set
  end

  def new
    @flashcard_set = FlashcardSet.new
    authorize @flashcard_set
  end

  def create
    @flashcard_set = FlashcardSet.new(flashcard_set_params)
    @flashcard_set.teacher = current_teacher
    authorize @flashcard_set
    if @flashcard_set.save
      redirect_to @flashcard_set
    else
      render :new
    end
  end

  def show
    authorize @flashcard_set
    @flashcard_templates = policy_scope(FlashcardTemplate.where(flashcard_set: @flashcard_set))
    @flashcard_template = FlashcardTemplate.new
    authorize @flashcard_template
    @topics = filter_topics(policy_scope(Topic))
  end

  def edit
    authorize @flashcard_set
  end

  def update
    authorize @flashcard_set
    if @flashcard_set.update(flashcard_set_params)
      redirect_to @flashcard_set
    else
      render :edit
    end
  end

  def destroy
    authorize @flashcard_set
    @flashcard_set.destroy
    redirect_to flashcard_sets_path
  end

  private

  def filter_topics(topics)
    topics.select { |topic| current_teacher.subjects.include?(topic.subject) }
  end

  def find_flashcard_set
    @flashcard_set = FlashcardSet.find(params[:id])
  end

  def flashcard_set_params
    params.require(:flashcard_set).permit(:name)
  end
end

class FlashcardTemplatesController < ApplicationController
  before_action :find_flashcard_template, only: [:show, :edit, :update, :destroy]

  def index
    @flashcard_set = FlashcardSet.find(params[:flashcard_set_id])
    @flashcard_templates = policy_scope(FlashcardTemplate.where(flashcard_set: @flashcard_set))
    @flashcard_template = FlashcardTemplate.new
    authorize @flashcard_template
  end

  def new
    @flashcard_template = FlashcardTemplate.new
    authorize @flashcard_template
    @topics = Topic.all
  end

  def create
    @flashcard_template = FlashcardTemplate.new(flashcard_template_params)
    @flashcard_template.teacher = current_teacher
    @flashcard_set = FlashcardSet.find(params[:flashcard_set_id])
    @flashcard_template.flashcard_set = @flashcard_set
    authorize @flashcard_template
    if @flashcard_template.save
      redirect_to flashcard_set_path(@flashcard_set)
    else
      render "flashcard_sets/show"
    end
  end

  def show
    authorize @flashcard_template
  end

  def edit
    authorize @flashcard_template
    @flashcard_set = FlashcardSet.find(params[:flashcard_set_id])
  end

  def update
    authorize @flashcard_template
    @flashcard_set = FlashcardSet.find(params[:flashcard_set_id])
    if @flashcard_template.update(flashcard_template_params)
      redirect_to flashcard_set_path(@flashcard_set)
    else
      render :edit
    end
  end

  def destroy
    authorize @flashcard_template
    @flashcard_set = FlashcardSet.find(params[:flashcard_set_id])
    @flashcard_template.destroy
    redirect_to flashcard_set_path(@flashcard_set)
  end

  private

  def find_flashcard_template
    @flashcard_template = FlashcardTemplate.find(params[:id])
  end

  def flashcard_template_params
    params.require(:flashcard_template).permit(:question, :answer, :topic_id)
  end
end

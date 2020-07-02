class FlashcardTemplateController < ApplicationController
  before_action :find_flashcard_template, only: [:show, :edit, :update, :destroy]

  def index
    @flashcard_templates = policy_scope(FlashcardTemplate)
    @flashcard_template = FlashcardTemplate.new
    authorize @flashcard_template
  end

  def new
    @flashcard_template = FlashcardTemplate.new
    authorize @flashcard_template
  end

  def create
    @flashcard_template = FlashcardTemplate.new(flashcard_template_params)
    @flashcard_template.teacher = current_teacher
    authorize @flashcard_template
    if @flashcard_template.save
      redirect_to @flashcard_template
    else
      render :new
    end
  end

  def show
    authorize @flashcard_template
  end

  def edit
    authorize @flashcard_template
  end

  def update
    authorize @flashcard_template
    if @flashcard_template.update(flashcard_template_params)
      redirect_to @flashcard_template
    else
      render :edit
    end
  end

  def destroy
    authorize @flashcard_template
    @flashcard_template.destroy
    redirect_to flashcard_templates_path
  end

  private

  def find_flashcard_template
    @flashcard_template = FlashcardTemplate.find(params[:id])
  end

  def flashcard_template_params
    params.require(:flashcard_template).permit(:name)
  end
end

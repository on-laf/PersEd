class FlashcardSetsController < ApplicationController

  def index
    @flashcard_sets = FlashcardSet.all
  end

  def new
    @flashcard_set = FlashcardSet.new
  end

  def create
    @flashcard_set = FlashcardSet.new(flashcard_set_params)
    @flashcard_set.teacher = current_teacher
    if @flashcard_set.save
      redirect_to @flashcard_set
    else
      render :new
    end
  end

  def show
    @flashcard_set = FlashcardSet.find(params[:id])
  end

  def edit
    @flashcard_set = FlashcardSet.find(params[:id])
  end

  def update
    @flashcard_set = FlashcardSet.find(params[:id])
    if @flashcard_set.update(flashcard_set_params)
      redirect_to(@flashcard_set)
    else
      render :edit
    end
  end

  def destroy
    @flashcard_set = FlashcardSet.find(params[:id])
  end

  private

  def flashcard_set_params
    params.require(:flashcard_set).permit(:name)
  end
end

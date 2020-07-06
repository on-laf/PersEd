class FlashcardHomeworksController < ApplicationController
  def new
    @flashcard_homework = FlashcardHomework.new
  end

  def create
    @flashcard_homework = FlashcardHomework.new
  end
end

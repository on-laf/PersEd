class QuizController < ApplicationController
  before_action :find_quiz, only: [:show, :edit, :update, :destroy]

def index
  @quizes = policy_scope(Quiz)
  authorize @quizes
end

def show
end

def new
end

def create

end

def update

end

def destroy

end

  private

  def quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:quiz_name, :teacher_id)
  end
end

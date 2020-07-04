class QuizQuestionsController < ApplicationController
  before_action :find_quiz_question, only: [:show, :edit, :update, :destroy]

  def index
    @quiz_questions = policy_scope(QuizQuestion)
    authorize @quiz_question
  end

  def show
    authorize @quiz_question
  end

  def new
    @quiz_question = QuizQuestion.new
    authorize @quiz_question
  end

  def create
    @quiz_question = QuizQuestion.new(quiz_question_params)
    authorize @quiz_question
    if @flashcard_template.save
      redirect_to quiz_questions_path
    else
      render :new
    end
  end

  def edit
    authorize @quiz_question
  end

  def update
    authorize @quiz_question
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    authorize @quiz_question
    @quiz_question.destroy
    redirect to quiz_questions_path
  end

  private

  def find_quiz_question
    @quiz_question = QuizQuestion.find(params[:id])
  end

  def quiz_question_params
    params.require(:quiz_question).permit(:quesion, :correct_answer, :A, :B, :C, :D, :topic_id)
  end
end

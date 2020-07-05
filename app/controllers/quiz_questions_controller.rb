class QuizQuestionsController < ApplicationController
  before_action :find_quiz_question, only: [:show, :edit, :update, :destroy]

  def index
    @quiz_questions = policy_scope(QuizQuestion)
    authorize @quiz_questions
  end

  def show
    authorize @quiz_question
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @quiz_question = QuizQuestion.new
    authorize @quiz_question
  end

  def create
    @quiz_question = QuizQuestion.new(quiz_question_params)
    authorize @quiz_question
    if @quiz_question.save
      redirect_to topic_quiz_questions_path
    else
      render "topics/show"
    end
  end

  def edit
    authorize @quiz_question
  end

  def update
    authorize @quiz_question
    if @quiz_question.update(quiz_question_params)
      redirect_to quiz_questions_path
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
    # is passing in the topic_id as a string
    params.require(:quiz_question).permit(:question, :correct_answer, :A, :B, :C, :D, :topic_id)
  end
end

class TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = policy_scope(Topic)
    @topic = Topic.new
    authorize @topic
    @subjects = current_teacher.subjects
  end

  def show
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    @subjects = current_teacher.subjects
    if @topic.save
      redirect_to topics_path
    else
      render :index
    end
  end

  def update
    authorize @topic
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    authorize @topic
    @topic.destroy
    redirect_to topics_path
  end

  private

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:topic_name, :subject_id)
  end
end

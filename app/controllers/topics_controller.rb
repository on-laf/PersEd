class TopicsController < ApplicationController
  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      redirect_to teacher_path(current_teacher)
    else
      render 'teachers/show'
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update(topic_params)
      redirect_to teacher_path(current_teacher)
    else
      render 'teachers/show'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    @topic.destroy
    redirect_to teacher_path(current_teacher)
  end

  private

  def topic_params
    params.require(:topic).permit(:topic_name, :subject_id)
  end
end

class MessageboardController < ApplicationController
  def index
    @course = params[:course]
    @topics = Topic.where(:course_id => @course)
  end

  def show
    @id = params[:id]
    @topic = Topic.find(@id)
  end

  def new
    @course = params[:course_id]
    @topic = Topic.new
  end

  def create
    @course = params[:course_id]
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to action: 'index', :course_id => @course
    else
      render 'new'
    end
  end

  private
  def topic_params
    # Also have to include that they are logged in
    params.require(:topic).permit(:description, :title, :course_id)
  end

end

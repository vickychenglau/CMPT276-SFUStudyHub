class MessageboardController < ApplicationController
  def index
    @course = params[:course]
    @topics = Topic.where(:course_id => @course)
    if !Course.find_by(:id => @course)
      @course_title = nil
    else
      @course_title = Course.find_by(:id => @course).name
    end
  end

  def show
    @id = params[:id]
    @topic = Topic.find(@id)
  end

  def new
    @course = params[:course]
    @topic = Topic.new
  end

  def create
    @course = params[:topic][:course]
    topic_params[:course_id] = @course
    @topic = Topic.new(topic_params)
    @topic.course_id = @course
    if @topic.course_id.nil?
        flash[:notice] = "Still not working"
    end
    if @topic.save
      redirect_to action: 'index', :course => @course
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

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
    @course = params[:][:course_id]
    @topic = Topic.new(topic_params)
    if @topic.course_id.nil?
      @topic.course_id = @course
    end
    if @topic.save
      flash[:notice] = params[:course_id]
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

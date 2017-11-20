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
    @user = User.find(@topic.user_id)
    @post = Post.where(parent: 0).where(topic_id: @id)
  end

  def new
    @course = params[:course]
    @topic = Topic.new
  end

  def destroy
    @course = params[:course]
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to action: 'index', :course => @course
  end

  def create
    @course = params[:topic][:course]
    topic_params[:course_id] = @course
    @topic = Topic.new(topic_params)
    @topic.course_id = @course
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to action: 'index', :course => @course
    else
      render 'new'
    end
  end

  private
  def topic_params
    # Also have to include that they are logged in
    params.require(:topic).permit(:description, :title, :course_id, :first_post)
  end

end

class MessageboardController < ApplicationController
  def index
    @course = params[:course]
    @topics = Topic.order("created_at DESC").where(:course_id => @course)
    if !Course.find_by(:id => @course)
      @course_obj = nil
      @course_title = nil
    else
      @course_obj = Course.find_by(:id => @course)
      @course_title = Course.find_by(:id => @course).name
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @user = User.find(@topic.user_id)
    @course = params[:course]
    @posts_order = params[:p_order]

    if !Course.find_by(:id => @course)
      @course_title = nil
    else
      @course_title = Course.find_by(:id => @course).name
    end
  end

  def new
    @course = params[:course]
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
    @course = params[:course]
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
    @topic.user_id = session[:user_id]
    @topic.pinned = false
    if @topic.save
      if !current_user.following?(@topic)
        current_user.follow(@topic)
      end

      @course_obj = Course.find_by(:id => @topic.course_id)
      @course_name = (@course_obj.name).slice(0..(@course_obj.name.index(':'))-1)
      ((@course_obj.users).uniq).each do |user|
        if user.following?(@course_obj)
          Notification.create(recipient: user, actor: current_user, action: "New Topic " << @topic.title << " in " << @course_name, notifiable: @topic)
        end
      end

      #@course_obj.all_following.each do |user|
      #    Notification.create(recipient: current_user, actor: current_user, action: "New Topic" << @topic.title << "in" << @course.name, notifiable: @topic)
      #end

      flash[:notice] = "New Topic was created"
      redirect_to action: 'index', :course => @course
    else
      flash[:notice] = "Failed to create topic"
      render 'new'
    end
  end

  def update
    @topic = Topic.find(params[:id])
    @course = params[:topic][:course]
    if @topic.update(topic_params)
      redirect_to action: 'index', :course => @course, notice: 'Topic was successfully updated.'
    else
      redirect_to action: 'index', :course => @course, notice: 'Topic was not updated.'
    end
  end

  def subscribe
    @topic = Topic.find(params[:id])
    if current_user
      if current_user.following?(@topic)
        current_user.stop_following(@topic)
      else
        current_user.follow(@topic)
      end
    else
      flash[:notice] = "You must log in to subscribe."
    end
    redirect_to :back
  end

  private
  def topic_params
    # Also have to include that they are logged in
    params.require(:topic).permit(:description, :title, :course_id, :first_post, :pinned)
  end

end

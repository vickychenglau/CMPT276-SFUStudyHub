class MessageboardController < ApplicationController
  def index
    @course = params[:course]
    @topics = Topic.where(:course_id => @course)
  end

  def show
    @id = params[:id]
    @topic = Topic.find(@id)
    @posts = Post.includes(:users).where(topic_id: @id)
  end

  def new
  end

end

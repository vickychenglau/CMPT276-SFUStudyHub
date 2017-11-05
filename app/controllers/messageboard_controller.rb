class MessageboardController < ApplicationController
  def index
    @course = params[:course]
    @topics = Topic.where(:course_id => @course)
  end

  def show
    @id = params[:id]
    @topic = Topic.find(@id)

    @post = Post.new
  end

  def new
  end

end

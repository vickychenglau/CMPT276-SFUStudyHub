class MessageboardController < ApplicationController
  def index
    @course = params[:course]
    @topics = Topic.where(:course_id => @course)
  end

  def show
    # redirect_to(:controller => 'posts', :action => 'index')
  end

  def new
  end

end

class MessageboardController < ApplicationController
  def index
    # Maybe show this in the admin page?
    @topics = Topic.all
  end

  def show
    # redirect_to(:controller => 'posts', :action => 'index')
  end

  def new
  end

end

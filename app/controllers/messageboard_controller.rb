class MessageboardController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
  end

  def new
  end

end

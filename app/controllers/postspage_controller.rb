class PostspageController < ApplicationController
  def index
    @topics = Topic.all
    @posts  = Post.where(topic_id: @topic.id)
    @users  = Users.where(id: @posts.user_id)
  end
  def new
    @post = Post.new
  end
end

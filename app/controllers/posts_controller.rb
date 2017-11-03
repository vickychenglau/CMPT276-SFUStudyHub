class PostsController < ApplicationController
  def index
    #@topics = Topic.where(id: id of current topic)
    @posts = Post.all
    #=@posts  = Post.where(topic: id of current topic)
    #@users  = User.where(id: @posts.user_id)

    @newpost = Post.new
  end
end

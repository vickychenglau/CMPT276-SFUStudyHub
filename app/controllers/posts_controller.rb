class PostsController < ApplicationController
  def index
    #@topics = Topic.where(id: id of current topic)
    #@topics = Topic.find(params[:id])
    @posts = Post.all
    #@posts = Post.where(topic: id of current topic)
    #@users = User.where(id: @posts.user_id)

    @newpost = Post.new
  end

  def create
    @post = Post.posts.new post_params

    if @post.save
      redirect_to :back, notice: 'Comment posted.'
    else
      redirect_to :back, notice: 'You comment was not posted.'
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

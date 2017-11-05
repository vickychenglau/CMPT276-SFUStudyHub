class PostsController < ApplicationController
before_action: find_postable

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = @postable.posts.new post_params

    if @post.save
      redirect_to :back, notice: 'Comment posted.'
    else
      redirect_to :back, notice: 'You comment was not posted.'
    end
  end

  private

  def comment_params
    params.require(:post).permit(:text)
  end

  def find_postable
    @postable = Post.find_by_id(params[:post_id]) if params[:post_id]
    @postable = Topic.find_by_id(params[:topic_id]) if params[:topic:id]
  end
  
end

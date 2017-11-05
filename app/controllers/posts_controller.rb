class PostsController < ApplicationController
before_action :find_postable

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = @postable.posts.new post_params
    @post.user_id = 1 #will need to change this later to the user in session
    @post.rating = 0.0
    @post.parent = 1

    if @post.save
      redirect_to :back, notice: 'Comment posted.'
    else
      redirect_to :back, notice: 'Your comment was not posted.'
    end
  end

  def destroy
    @post.destroy
    redirect_to :back, notice: 'Post deleted'
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end

  def find_postable
    @postable = Post.find_by_id(params[:post_id]) if params[:post_id]
    @postable = Topic.find_by_id(params[:topic_id]) if params[:topic_id]
  end

end

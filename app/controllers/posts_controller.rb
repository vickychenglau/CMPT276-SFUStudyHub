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
    @post.user_id = current_user.id
    @post.deleted = false

    if @post.save
      @topic = Topic.find(@post.topic_id)
      @OP = User.find(@topic.user_id)

      ((@topic.users.uniq + [@OP] - [current_user]).uniq).each do |user|
        Notification.create(recipient: user, actor: current_user, action: "New Post in " << @topic.title, notifiable: @topic)
      end

      redirect_to :back, notice: 'Comment posted.'
    else
      redirect_to :back, notice: 'Your comment was not posted.'
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update(post_params)
      redirect_to :back, notice: 'Post was successfully updated.'
    else
      redirect_to :back, notice: 'Post was not updated.'
    end
  end

  def destroy
    @post.destroy
    redirect_to :back, notice: 'Post deleted'
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:topic_id, :user_id, :text, :anon, :deleted)
  end

  def find_postable
    @postable = Post.find_by_id(params[:post_id]) if params[:post_id]
    @postable = Topic.find_by_id(params[:topic_id]) if params[:topic_id]
  end

end

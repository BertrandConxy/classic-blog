class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_author, only: %i[index show destroy]

  def index
    @posts = @author.posts
  end

  def show
    @post = @author.posts.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to user_post_url(user_id: params[:user_id], id: @post.id), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to users_post_url(@post), notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      redirect_to user_posts_url(params[:user_id]), notice: 'Post was successfully destroyed.'
    else
      redirect_to user_posts_url(params[:user_id]), notice: 'Post was not deleted'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_author
    @author = User.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :comments_count, :likes_count, :user_id)
  end
end

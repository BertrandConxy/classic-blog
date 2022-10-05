class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_author, only: %i[ index show destroy ]

  def index
    @posts = @author.posts
  end

  def show
    @post = @author.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to users_post_url(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
      if @post.update(post_params)
        redirect_to users_post_url(@post), notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy

    if @post.destroy
      redirect_to posts_url, notice: "Post was successfully destroyed."
    else
      redirect_to posts_url, notice: "Post was not deleted"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_author
      @author = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :comments_count, :likes_count, :user_id)
    end
end

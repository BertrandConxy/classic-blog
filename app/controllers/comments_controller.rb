class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to user_post_path(user_id: params[:user_id], id: @post.id), notice: 'Comment has been added successfully'
    else
      redirect_to user_post_path(user_id: params[:user_id], id: @post.id), alert: 'Comment could not be created'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:comment_id])
    if @comment.destroy
      redirect_to user_post_path(user_id: params[:user_id], id: @post.id), notice: 'Comment has been deleted successfully'
    else
      redirect_to user_post_path(user_id: params[:user_id], id: @post.id), alert: 'Comment could not be deleted'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.permit(:text, :user_id, :post_id)
  end
end

class LikesController < ApplicationController
  load_and_authorize_resource
  before_action :set_like, only: %i[create destroy]

  def create
    post = Post.find(params[:post_id])
    @like = Like.new(post: post, user: current_user)
    if @like.saved?
      redirect_to user_post_path(id: params[:post_id]), alert: 'Already liked'
    elsif @like.save
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]),
                  notice: 'like has been added successfully'
    else
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), alert: 'like could not be created'
    end
  end

  def destroy
    if @like.destroy
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]),
                  notice: 'like has been deleted successfully'
    else
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), alert: 'like could not be deleted'
    end
  end

  private

  def set_like
    @like = Like.where(user_id: params[:user_id], post_id: params[:post_id])
  end
end

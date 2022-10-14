class LikesController < ApplicationController
  before_action :set_like, only: %i[create destroy]

  def create
    post = Post.find(params[:post_id])
    @like = Like.new(post: post, user: current_user)
    if !@like.saved?
      if @like.save
        redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), notice: 'like has been added successfully'
      else
        redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), alert: 'like could not be created'
      end
    else
      # redirect_to user_post_like_url(id: @like, user_id: params[:user_id], post_id: params[:post_id])
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), alert: 'Already liked'
    end
  end

  def destroy
    if @like.destroy
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), notice: 'like has been deleted successfully'
    else
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), alert: 'like could not be deleted'
    end
  end

  private

  def set_like
    @like = Like.where(user: current_user, post: params[:post_id])
  end

end

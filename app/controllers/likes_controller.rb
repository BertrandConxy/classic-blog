class LikesController < ApplicationController
  before_action :set_like, only: %i[create destroy]

  def create
    @like = Like.new(post_id: params[:post_id], user_id: current_user)
    if @like.save
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), notice: 'like has been added successfully'
    else
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), alert: 'like could not be created'
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

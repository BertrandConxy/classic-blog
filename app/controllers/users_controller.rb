class UsersController < ApplicationController
  def index
    @users = User.all.with_attached_image
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user: @user)
  end
end

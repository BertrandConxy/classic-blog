class UsersController < ApplicationController
  def index
    @users = User.all.with_attached_image
  end

  def show; end
end

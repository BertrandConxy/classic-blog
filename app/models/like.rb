class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  validates :user_id, :post_id, presence: true


  def saved?
    like = Like.where(post: post, user: user)
    like.exists?
  end
end

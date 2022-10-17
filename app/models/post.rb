class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates_associated :comments, :likes
  validates :title, :body, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_count, :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

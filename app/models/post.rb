class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :title, :body, presence: true
end

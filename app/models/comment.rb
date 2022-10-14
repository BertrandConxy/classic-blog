class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  validates :text, presence: true, length: { maximum: 800 }
end

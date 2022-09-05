class Argument < ApplicationRecord
  belongs_to :user
  belongs_to :debate
  has_many :comment_like_users
  has_many :comment_swipe_users

  validates :content, presence: true, length: { in: 6..200 }
end

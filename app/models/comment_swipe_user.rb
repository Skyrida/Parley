class CommentSwipeUser < ApplicationRecord
  belongs_to :user
  belongs_to :argument

  validates :argument_agree, presence: true
end

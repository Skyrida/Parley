class CommentSwipeUser < ApplicationRecord
  belongs_to :user
  belongs_to :argument

end

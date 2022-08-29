class CommentLikeUser < ApplicationRecord
  belongs_to :argument
  belongs_to :user
end

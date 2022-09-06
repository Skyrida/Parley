class CommentSwipeUser < ApplicationRecord
  belongs_to :user
  belongs_to :argument

  after_create_commit :like_counter
  after_update_commit :like_discounter

  def like_counter
    argument.comment_swipe_users_count += 1
    argument.save
  end

  def like_discounter
    if argument_agree == false
      argument.comment_swipe_users_count -= 1
      argument.save!
    else
      argument.comment_swipe_users_count += 1
      argument.save
    end
  end
end

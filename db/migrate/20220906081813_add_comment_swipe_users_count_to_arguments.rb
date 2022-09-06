class AddCommentSwipeUsersCountToArguments < ActiveRecord::Migration[7.0]
  def change
    add_column :arguments, :comment_swipe_users_count, :integer, default: 0
  end
end

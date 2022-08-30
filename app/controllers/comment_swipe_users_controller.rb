class CommentSwipeUsersController < ApplicationController
  def create

  end

  private

  def swipe_params
    params.require(:comment_swipe_user).permit(:argument_agree)
  end
end

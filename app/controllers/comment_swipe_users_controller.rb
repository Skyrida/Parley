class CommentSwipeUsersController < ApplicationController
  def create
    @like_function = CommentSwipeUser.new(argument_id: params[:argument_id], user: current_user, argument_agree: true)
    @debate = @like_function.argument.debate

    respond_to do |format|
      if @like_function.save!
        format.html { redirect_to request.referer }
        format.json { render json: :ok }
      else

      end
    end
  end

  def update
    @like_function = CommentSwipeUser.find(params[:id])
    @debate = @like_function.argument.debate

    if @like_function.argument_agree == true
      @like_function.argument_agree = false
    else
      @like_function.argument_agree = true
    end

    if @like_function.save
      redirect_to debate_path(@debate)
    else

    end
  end

  private

  def swipe_params
    params.require(:comment_swipe_user).permit(:argument_agree)
  end
end

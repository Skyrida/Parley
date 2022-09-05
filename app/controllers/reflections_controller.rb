class ReflectionsController < ApplicationController
  def show
    @reflection = Reflection.find(params[:id])
    @chatroom = Chatroom.find(@reflection.chatroom_id)
    @debate = Debate.find(@chatroom.debate_id)

    if @chatroom.user_for_id == current_user.id
      @debate_partner = User.find(@chatroom.user_against_id)
    else
      @debate_partner = User.find(@chatroom.user_for_id)
    end
  end

  def new
    @chatroom = Chatroom.find(params[:chatroom_id])
    @debate = Debate.find(@chatroom.debate_id)
    @reflection = Reflection.new()

    if @chatroom.user_for_id == current_user.id
      @debate_partner = User.find(@chatroom.user_against_id)
    else
      @debate_partner = User.find(@chatroom.user_for_id)
    end
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @reflection = Reflection.new(reflections_params)
    @reflection.user = current_user
    @reflection.chatroom = @chatroom

    if @reflection.save
      redirect_to reflection_path(@reflection)
    else
      render :new
    end
  end

  private

  def reflections_params
    params.require(:reflection).permit(:debate_chat_score, :conclusion)
  end
end

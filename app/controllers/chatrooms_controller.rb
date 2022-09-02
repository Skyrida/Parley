class ChatroomsController < ApplicationController
  def index

  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @debate = Debate.find(params[:debate_id])
    @waiting_for_chat = @debate.users.where(looking_for_chatroom: true).where.not(id: current_user.id)

    if @waiting_for_chat.count < 1
      current_user.looking_for_chatroom = true
      current_user.save
      redirect_to debate_search_path(@debate)
    else
      @user_for = @waiting_for_chat.first
      @user_against = current_user
      @chatroom = Chatroom.new(user_for: @user_for, user_against: @user_against, debate: @debate)
      
      if @chatroom.save
        @user_for.looking_for_chatroom = false
        @user_against.looking_for_chatroom = false

        redirect_to chatroom_path(@chatroom)
      else
        # something - what should it do if the save is not successful?
      end
    end
  end

  def leave
    @chatroom = Chatroom.find(params[:chatroom_id])
    # Optional: display a message that the user left the chat
    @chatroom.status_active = false
    @chatroom.save
    
    @debate = @chatroom.debate
    redirect_to debate_path(@debate)
  end
end

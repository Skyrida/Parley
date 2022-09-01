class ChatroomsController < ApplicationController
  def index

  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @debate = Debate.find(params[:id])
    @waiting_for_chat = @debate.users.where(looking_for_chatroom: true)
    
    if @waiting_for_chat.count < 1
      current_user.looking_for_chatroom = true
      current_user.save
      redirect_to search_path(@debate)
    else
      @user_for = @waiting_for_chat.first
      @user_against = current_user
      @chatroom = Chatroom.new(user_for: @user_for, user_against: @user_against, debate: @debate)
      
      if @chatroom.save
        redirect_to chatroom_path(@chatroom)
      else
        # something - what should it do if the save is not successful?
      end
    end
  end
end

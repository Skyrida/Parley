class ChatroomsController < ApplicationController
  def index

  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    
  end
end

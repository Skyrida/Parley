class DebatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query]
      @tags = Debate.select { |debate| debate.tag_list.map(&:downcase).include?(params[:query].downcase) }.to_a
      @titles = Debate.search_by_title_and_taglist(params[:query]).to_a
      @tags << @titles
      @debates = @tags.flatten.uniq
    else
      @debates = Debate.all
    end
  end


  def show
    @debate = Debate.find(params[:id])
    @arguments = @debate.arguments

    if params[:category] == "pro"
      @arguments = @debate.arguments.where(perspective_pro: true)
    elsif params[:category] == "con"
      @arguments = @debate.arguments.where(perspective_pro: false)
    end
  end

  def new
    @debate = Debate.new
  end

  def create
    @debate = Debate.new(debate_params)
    @debate.user = current_user

    if @debate.save
      redirect_to debate_path(@debate)
    else
      redirect_to new_debate_path
    end
  end

  def destroy

  end

  def search
    @debate = Debate.find(params[:debate_id])
    @my_chat = current_user.chatrooms_for.find_by(status_active: true)

    if @my_chat == nil
      @my_chat = current_user.chatrooms_against.find_by(status_active: true)
    end


    if @my_chat
      respond_to do |format|
        format.html { redirect_to chatroom_path(@my_chat) }
        format.json
      end
    else
      # stimulus
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  private

  def debate_params
    params.require(:debate).permit(:title, :description, :tag_list)
  end
end

require_relative '../services/twitter_api_service'

class DebatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @global_ideas = TwitterApiService.new.client.trends(id = 2459115, options = { exclude: "hashtags" })
    # @local_ideas = TwitterApiService.new.client.trends(id = 1047378, options = { exclude: "hashtags" })
    if params[:query].present? && params[:mine].present?
      @tags = (current_user.your_debates + current_user.your_arguemtens + current_user.your_likes).select { |debate| debate.tag_list.map(&:downcase).include?(params[:query].downcase) }.to_a
      @titles = Debate.search_by_title_and_taglist(params[:query]).to_a.select do |debate|
      current_user.your_debates.include?(debate) || current_user.your_arguemtens.include?(debate) || current_user.your_likes.include?(debate)
      end
      @tags << @titles
      @debates = @tags.flatten.uniq
    elsif !params[:query].present? && params[:mine].present?
      @tags = (current_user.your_debates + current_user.your_arguemtens + current_user.your_likes).to_a
      @titles = Debate.search_by_title_and_taglist(params[:query]).to_a
      @tags << @titles
      @debates = @tags.flatten.uniq
    elsif params[:query]
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

    # @arguments = @arguments.where(comment_swipe_users: { argument_agree: true }).order(comment_swipe_users_count: :DESC)
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

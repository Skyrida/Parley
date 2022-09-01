class DebatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:title]
      @debates = Debate.where(title: params[:title])
    elsif params[:query]
      @debates = Debate.search_by_title(params[:query])
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

  private

  def debate_params
    params.require(:debate).permit(:title, :description, :tag_list)
  end
end
